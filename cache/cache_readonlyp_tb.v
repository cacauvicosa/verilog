// iverilog -o my_design  ram.v tag.v datacache.v fsm.v counter.v mux.v valid.v comparator.v top_cache_read_only.v cache_readonly_tb.v
/*
Then run it:

vvp my_design

Then look at the test.vcd waveform:

gtkwave test.vcd & 
*/
module test;

  /* Make a reset that pulses once. */
  reg reset = 0;
  reg [10:0] address = 11'h0;
  reg [7:0] din = 8'h0;

  initial begin
     $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 10 din = 8'h0;
     # 20 reset = 1;
     # 10 reset = 0;
     # 20 address = 11'h5;
     # 20 address = 11'h21;
     # 30 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [7:0] dout;

  cache_read_only Mycache(clk, reset, address, dout, din);

  initial
     $monitor("At time %t, address = %0d  dout = %0d",
              $time, address, dout);
endmodule // test
