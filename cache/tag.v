// simpletag cache 4 lines tag 6 bits 
module Mtag ( clk, line,  din, wr, dout , reset);
input clk;
input [1:0] line;
input [5:0] din;
input wr;
output [5:0] dout;
input reset;


reg [5:0] memory[0:3];
reg [5:0] dout;

always @(posedge clk )
  begin
    if (wr)
      memory[line] <= din; 
  end

always @ (*)
  begin 
  dout <= memory[line];
  end

always @( posedge reset) 
			if(reset) // inicia  para testes
				begin
				  memory[0] <= 6'h3;
				  memory[1] <= 6'h4;
				  memory[2] <= 6'h5;
				  memory[3] <= 6'h6;
				end


endmodule


