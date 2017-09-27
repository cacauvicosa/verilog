module fsm(
  input wire clk, reset, c, v, END, 
  output reg Twr, Dwr, Rwr, Cnt, Mux);

reg [1:0] state, next_state;

parameter ReadTag = 2'b00, ReadData = 2'b01, ReadBlk = 2'b10, UpdateTag = 2'b11;

/* State register (synchronous reset) */
always @(posedge clk) begin
  if (reset) begin
    state <= ReadTag;
  end
  else begin
    state <= next_state;
  end
end

/* Next state logic */
always @(*) begin
  case (state)
    ReadTag: begin
      next_state = (c&v) ? ReadData : ReadBlk;
    end
    ReadData: begin
      next_state = ReadTag;
    end
    ReadBlk: begin
      next_state = (END) ? UpdateTag : ReadBlk;
    end
    UpdateTag: begin
      next_state = ReadTag;
    end
  endcase
end

/* Output logic */
always @(*) begin
  Cnt = (state == ReadTag); 
  Twr = (state == UpdateTag);
  Dwr = (state == ReadBlk);
  Rwr = 0; 
  Mux = (state == ReadBlk);
end

endmodule
