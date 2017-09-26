// simpletag cache 4 lines tag 6 bits 
module tag ( clk, line,  din, wr, dout );
input clk;
input [1:0] line;
input [5:0] din;
input wr;
output [5:0] dout;

reg [5:0] memory[0:31];
reg [5:0] dout;

always @(posedge clk )
  begin
    if (wr)
      memory[line] <= din; 
  end

always @ (line)
  begin 
  dout = memory[line];
  end


endmodule


