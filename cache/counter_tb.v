// iverilog -o my_design  counter.v fsm_counter_tb.v
/*
Then run it:

vvp my_design

Then look at the test.vcd waveform:

gtkwave test.vcd & 
*/
module test;

  /* Make a reset that pulses once. */
  reg reset = 0;

  initial begin
     $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 20 reset = 1;
     # 10 reset = 0;
     # 30 reset = 1;
     # 1  reset = 0;
     # 20 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [2:0] dout;
  wire End;

  counter  count(dout, clk, reset, End);

  initial
     $monitor("At time %t, End = %0d  dout = %0d",
              $time, End, dout);
endmodule // test
