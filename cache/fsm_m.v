module fsm_m (clk, reset,End , ch , done, chout, rst);
input clk, reset, End, ch;
output done, chout, rst;

reg done, chout, rst;

reg [1:0] state;

parameter Initial = 2'b00, Count = 2'b01, Done = 2'b10, Change = 2'b11;

/* State register (synchronous reset) */
always @(posedge clk or posedge reset) 
begin
  if (reset) 
    state <= Initial;
  else 
    case (state)
    Initial: 
      state <= Count;
    Count: 
      if (End && !ch)  state <= Done;
      else if (End && ch ) state <= Change;
      else state <= Count;
    Done: 
      state <= Initial;
    Change: 
      state <= Initial;    
  endcase
end

/* Output logic */
always @(*) begin
  rst = (state == Initial); 
  done = (state == Done || state == Change);
  chout = (state == Change);
end

endmodule
