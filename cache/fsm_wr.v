module fsm(
  input wire clk, reset, c, v, END, d, w, 
  output reg Twr, Dwr, Rwr, Cnt, Mux, MuxTag, Wwr, dirty);

reg [2:0] state;

parameter ReadTag = 3'b000, ReadData = 3'b001, ReadBlk = 3'b010, UpdateTag = 3'b011, WrBlk = 3'b100, WrData = 3'b101;

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
