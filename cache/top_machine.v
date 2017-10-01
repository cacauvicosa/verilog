module machine(
clk, reset, c5, c10, c20, done, change
);
input clk;
input reset;
input c5,c10,c20;
output done;
output [1:0] change;


wire [2:0] money;

assign money = (c20) ? 3'b100 :
               (c10) ? 3'b010 : 
               (c5) ? 3'b001:3'b000; 

wire End, ch, chout;
wire [1:0] Change;
wire  rst;

fsm_m FSM (.clk (clk), .reset (reset),.End (End) , .ch (ch), .done(done), .chout (chout), .rst(rst));

counter_m Cnt (.clk(clk), .reset(rst), .money(money), .End(End), .ch(ch), .out(Change));

assign change = (chout)?Change: 2'b00;

endmodule
