// iverilog -o my_design top_machine.v counter_m.v fsm_m.v machine_tb.v
/*
Then run it:

vvp my_design

Then look at the test.vcd waveform:

gtkwave test.vcd & 
*/
module test;

  /* Make a reset that pulses once. */
  reg reset = 0;
  reg c5 = 0;
  reg c10 = 0;
  reg c20 = 0;

  initial begin
     $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 2 reset = 1;
     # 2 reset = 0;
     # 2 c5 =1;
     # 2 c5 = 0;
     # 0 c10 = 1;
     # 4 c10 = 0;
     # 4 c5 = 1;
     # 4 c5 = 0;
     # 2 c20 = 1;
     # 2 c20 = 0;
     # 6 c20 = 1;
     # 4 c20 = 0;
     # 10 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [1:0] change;
  wire done;

 machine m(
.clk(clk), .reset(reset), .c5(c5), .c10(c10), .c20(c20), .done(done), .change(change)
);

  initial
     $monitor("At time %t, change = %0d  done = %0d",
              $time, change, done);
endmodule // test
