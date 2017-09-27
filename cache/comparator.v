
/*
  6 bits comparator
*/

module comparator(out, tag, tag_in);

  output  out;
  input   [5:0] tag;
  input   [5:0] tag_in;

 
  

assign out =  ( tag == tag_in )? 1 : 0;      


endmodule 

