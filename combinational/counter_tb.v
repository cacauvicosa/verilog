/*
http://iverilog.wikia.com/wiki/Getting_Started

add also counter_tb.v for test (inject inputs...)
Compile

iverilog -o my_design  counter_tb.v counter.v
vvp my_design

*/

module test;

  /* Make a reset that pulses once. */
  reg reset = 0;
  initial begin
     # 17 reset = 1;
     # 11 reset = 0;
     # 29 reset = 1;
     # 11 reset = 0;
     # 100 $stop;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;

  wire [7:0] value;
  counter c1 (value, clk, reset);

  initial
     $monitor("At time %t, value = %h (%0d)",
              $time, value, value);
endmodule // test

