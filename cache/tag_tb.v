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
 reg [5:0] din = 8'h0; 
 reg [1:0] address = 2'h0;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 1 reset = 1;
     # 5 reset = 0;
     # 1 din = 8'h0;
     # 2 address = 2'h0;
     # 2 address = 2'h3;
     # 2 address = 2'h1;
     # 2 address = 2'h2;
     # 1 din = 8'h09;
     # 1 address = 2'h1;
     # 0 Dwr = 1;
     # 2 Dwr = 0;
     # 2 address = 2'h2;
     # 2 address = 2'h1;
     
     # 20 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [5:0] Rout;

  Mtag T( clk, address, din, Dwr, Rout , reset);

  initial
     $monitor("At time %t, End = %0d  dout = %0d",
              $time, address, Rout);
endmodule // test
