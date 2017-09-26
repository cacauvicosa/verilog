// simple RAM 2k bytes
module ram ( clk, addr, din, wr, dout );
input clk;
input [10:0] addr; 
input [7:0] din;
input wr;
output [7:0] dout;

reg [7:0] memory[0:2047];
reg [7:0] dout;

always @(posedge clk )
  begin
    dout <= memory[addr];
    if (wr)
      memory[addr] <= din; 
  end

reg k;

initial
  begin
    for (k = 8'h00; k < 8'hFF ; k = k + 8'h1)
       begin
         memory[k] = k;
       end
    end 

endmodule


