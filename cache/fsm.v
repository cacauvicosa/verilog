module fsm(
  input wire clk, reset, c, v, END, 
  output reg Twr, Dwr, Rwr, Cnt, Mux);

reg [1:0] state;

parameter ReadTag = 2'b00, ReadData = 2'b01, ReadBlk = 2'b10, UpdateTag = 2'b11;

/* State register (synchronous reset) */
always @(posedge clk or posedge reset) 
begin
  if (reset) 
    state <= ReadTag;
  else 
    case (state)
    ReadTag: 
      if (c && v)  state <= ReadData;
      else state <= ReadBlk;

    ReadData: 
      state <= ReadTag;
    
    ReadBlk: 
      if (END) state <= UpdateTag;
      else     state <= ReadBlk;
    
    UpdateTag: 
      state <= ReadTag;
    
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
