// simple Data cache 32 bytes blk 8 
module datacache ( clk, line, blk, din, wr, dout );
input clk;
input [1:0] line;
input [2:0] blk; 
input [7:0] din;
input wr;
output [7:0] dout;

reg [7:0] memory[0:31];
reg [7:0] dout;

always @(posedge clk )
  begin
    dout <= memory[{line,blk}]; // {} concatenation
    if (wr)
      memory[{line,blk}] <= din; 
  end



endmodule


