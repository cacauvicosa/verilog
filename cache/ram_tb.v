// iverilog -o my_design   ram.v ram_tb.v
/*
Then run it:

vvp my_design

Then look at the test.vcd waveform:

gtkwave test.vcd & 
*/
module test;

  /* Make a reset that pulses once. */
 reg Dwr = 0;
 reg reset = 0;
 reg [7:0] din = 8'h0; 
 reg [10:0] address = 11'h0;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 1 reset = 1;
     # 5 reset = 0;
     # 1 din = 8'h0;
     # 1 address = 11'h03;
     # 1 address = 11'h05;
     # 1 din = 8'h09;
     # 1 address = 11'h03;
     # 0 Dwr = 1;
     # 1 Dwr = 0;
     # 1 address = 11'h05;
     # 1 address = 11'h03;
     
     # 20 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [7:0] Rout;

  ram myRam( clk, address, din, Dwr, Rout , reset);

  initial
     $monitor("At time %t, End = %0d  dout = %0d",
              $time, din, Rout);
endmodule // test
