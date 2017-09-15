/*
http://iverilog.wikia.com/wiki/Getting_Started



iverilog -o my_design  decoder_using_case_tb.v decoder_using_case.v
vvp my_design

*/

module test;

  reg [3:0] binary_in  ;
  reg   enable = 1 ;
  always #5 binary_in = binary_in + 1;
  
  initial begin     
     # 50 $stop;
  end

  wire [15:0] value;
  decoder_using_case c1 (binary_in,value,enable);

  initial
     $monitor("At time %t, in = %0d value = %h (%0d)",
              $time, binary_in, value, value);
endmodule // test

