// simple RAM 2k bytes
module ram ( clk, addr, din, wr, dout, reset );
input clk;
input [10:0] addr; 
input [7:0] din;
input wr;
output [7:0] dout;
input reset;

reg [7:0] memory[0:2047];
reg [7:0] dout;


always @(posedge clk )
  begin  
    if (wr)
      memory[addr] <= din; 
  end

always @ (*)
  begin 
  dout <= memory[addr];
  end

 always @(posedge reset) 
			if(reset) // inicia  para testes
				begin
				  memory[0] <= 10;
				  memory[1] <= 11;
				  memory[2] <= 12;
				  memory[3] <= 13;
				  memory[4] <= 14;
				  memory[5] <= 15;
				  memory[6] <= 16;
				  memory[7] <= 17;
				  memory[8] <= 18;
				  memory[9] <= 19;
				  memory[10] <= 20;
				  memory[11] <= 21;
				  memory[12] <= 22;
				  memory[13] <= 23;
				  memory[14] <= 24;
				  memory[15] <= 25;
				  memory[16] <= 26;
				  memory[17] <= 27;
				  memory[18] <= 28;
				  memory[19] <= 29;
				  memory[20] <= 30;
				  memory[21] <= 31;
				  memory[22] <= 32;
				  memory[23] <= 33;
				  memory[24] <= 34;
				  memory[25] <= 35;
				  memory[26] <= 36;
				  memory[27] <= 37;
				  memory[28] <= 38;
				  memory[29] <= 39;
				  memory[30] <= 40;
				  memory[31] <= 41;
				end


endmodule


