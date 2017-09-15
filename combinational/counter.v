/*
http://iverilog.wikia.com/wiki/Getting_Started

add also counter_tb.v for test (inject inputs...)
Compile

iverilog -o my_design  counter_tb.v counter.v

vvp my_design

*/

module counter(out, clk, reset);

  parameter WIDTH = 8;

  output [WIDTH-1 : 0] out;
  input 	       clk, reset;

  reg [WIDTH-1 : 0]   out;
  wire 	       clk, reset;

  always @(posedge clk)
    out <= out + 1;

  always @reset
    if (reset)
      assign out = 0;
    else
      deassign out;

endmodule // counter

