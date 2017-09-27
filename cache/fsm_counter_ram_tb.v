// iverilog -o my_design   fsm.v counter.v fsm_counter_tb.v
/*
Then run it:

vvp my_design

Then look at the test.vcd waveform:

gtkwave test.vcd & 
*/
module test;

  /* Make a reset that pulses once. */
  reg reset = 0;
 reg c =0;
 reg v = 0;
 reg [7:0] din = 8'h0; 

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
     # 1 din = 8'h0;
     # 10 reset = 1;
     # 1 reset = 0;
     # 10 v = 1;
     # 1  c = 1;
     # 3  v = 0;
     # 20 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [2:0] Counter;
  wire [7:0] Rout;
  wire Cnt;
  wire END;
  wire Twr, Dwr, Rwr, Mux;

  counter  count(Counter, clk, Cnt, END);
  fsm FSM ( clk, reset, c, v, END, 
              Twr, Dwr, Rwr, Cnt, Mux);
  ram myRam( clk, {8'h0,Counter}, din, Dwr, Rout );

  initial
     $monitor("At time %t, End = %0d  dout = %0d",
              $time, END, Rout);
endmodule // test