module fsm_lru_cc( din, dout, v );
input [1:0] din;
output [1:0] dout;
input [1:0]  v;

reg [1:0] dout;


always @ (*)
begin
  if ( din == v ) dout = 0;
  else if ( din < v ) dout = din + 1;
  else dout = din;
end

endmodule
