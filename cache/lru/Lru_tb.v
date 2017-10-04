// iverilog -o my_design Lru_tb.v fsm_Lru.v preditor_table.v
/*
Then run it:

vvp my_design

Then look at the test.vcd waveform:

gtkwave test.vcd & 
*/
module test;

  /* Make a reset that pulses once. */
  reg reset = 0;
  reg [6:0] address = 7'h0;
  reg [1:0] p = 2'd0;

  initial begin
     $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 2 reset = 1;
     # 2 reset = 0;
     # 2 address = 7'h2;
     # 1 p = 1;
     # 2 p = 0;
     # 2 p = 3;
     # 2 p = 2;
     # 2 p = 1;
     # 10 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [1:0] dout;
  wire [1:0] din;

fsm_lru_cc  CC( .din(dout), .dout(din),.v(p) );
pred_table tab( .clk(clk), .line(address),  .din(din), .dout(dout) , .reset(reset));

  initial
     $monitor("At time %t, address = %0d  dout = %0d",
              $time, address, dout);
endmodule // test
