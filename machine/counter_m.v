
/*
  Total = 8, c5 = 1, c10 = 2
*/

module counter_m (clk, reset, money, End, ch, out);

  input 	       clk, reset;
  input [2:0] money;
  output End, ch;
  output [1:0] out;

  reg [3:0] count;
  reg End,ch;
  wire [3:0] result;
  
  always @(posedge clk, posedge reset)
  begin
    if ( reset )  count <= 4'b0000;
    else count <= count + money;
  end 

  always @(count)
  begin
    End = 0; ch = 0;
    if ( count >= 4'b1000 ) End = 1;
    if ( count >  4'b1000 ) ch = 1;
  end

  assign result = count -4'b1000;
  assign out = result[1:0];
 
endmodule // counter

