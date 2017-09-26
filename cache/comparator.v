
/*
  6 bits comparator
*/

module counter(out, clk, tag, tag_in);

  output  out;
  input   clk;
  input   [5:0] tag, [5:0] tag_in;

  reg   out;
 

  always @(posedge clk)
    out <= out + 1;

  always @(posedge clk)
    if ( tag == tag_in )
       assign out = 1;
    else 
       assign out = 0;
      
endmodule // counter

