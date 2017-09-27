
/*
  6 bits comparator
*/

module comparator(out, clk, tag, tag_in);

  output  out;
  input   clk;
  input   [5:0] tag;
  input   [5:0] tag_in;

  reg   out;
 

  always @(posedge clk)
    out <= out + 1;

  always @(posedge clk)
    if ( tag == tag_in )
       assign out = 1;
    else 
       assign out = 0;
      
endmodule 

