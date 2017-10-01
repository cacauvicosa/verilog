// write cache 4 lines 
module dirty ( clk, line, din, wr, dout );
input clk;
input [1:0] line;
input din;
input wr;
output dout;

reg memory[0:3];


always @(posedge clk )
  begin
    if (wr)
      memory[line] <= din; 
  end

assign  dout = memory[line];



endmodule


