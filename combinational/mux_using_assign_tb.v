/*
http://iverilog.wikia.com/wiki/Getting_Started



iverilog -o my_design  mux_using_assign_tb.v mux_using_assign.v
vvp my_design

*/

module test;

  reg din_0=0 ; // Mux first input
  reg din_1=0; // Mux Second input
  reg sel = 0;         // Select input
  always #5 din_0 = !din_0;
  always #10 din_1 = !din_1;
  always #20 sel = !sel;
  initial begin     
     # 50 $stop;
  end

  wire value;
  mux_using_assign c1 (din_0,din_1,sel,value);

  initial
     $monitor("At time %t, sel %0d d1 = %0d d0 = %0d  OUTPUT = %h (%0d)",
              $time, sel, din_1, din_0, value, value);
endmodule // test

