
/*
 3 bit counter
*/

module counter(out, clk, reset, End);

  output [2 : 0] out;
  input 	       clk, reset;
  output End;

  reg [2 : 0]   out;
  reg End;
  wire 	       clk, reset;

  always @(posedge clk)
    out <= out + 1;

  always @(posedge clk)
    if ( out == 3'd6 )
       assign End = 1;
    else 
       assign End = 0;
      

  always @reset
    if (reset)
      assign out = 0;
    else
      deassign out;

endmodule // counter

