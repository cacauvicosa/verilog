// valid cache 4 lines 
module valid ( clk, line,  reset, wr, dout );
input clk;
input [1:0] line;
input reset;
input wr;
output dout;

reg memory[0:3];
reg dout;


always @(posedge clk )
  begin
    if (wr)
      memory[line] <= 1; 
  end

always @ (line)
  begin 
  dout = memory[line];
  end


always @ (reset)
  begin 
    memory[0]= 0;
    memory[1]= 0;
    memory[2]= 0;
    memory[3]= 0;
  end

endmodule


