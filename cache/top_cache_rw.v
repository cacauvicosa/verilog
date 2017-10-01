module cache_read_only(
clk, reset, address, w, dout, din
);
input clk;
input reset;
input [10:0] address;
input w;
output [7:0] dout;
input [7:0] din;




wire [1:0] line;
wire [2:0] blk;
wire [5:0] tag;

assign tag = address[10:5];
assign line = address[4:3];
assign blk = address[2:0];

wire Twr,Dwr,Rwr;
wire END, cnt, c, v, Dmux;
wire [7:0] Ram2Cache;
wire [2:0] Mux1;
wire [2:0] Muxout;
wire MuxSel;
wire [5:0] Tout;
wire [7:0] Cache2out;

assign  dout = Cache2out;




fsm  FSM(
  .clk (clk), 
  .reset (reset),
  .c (c) ,
  .v (v),
  .END (END),
  .Twr (Twr),
  .Dwr (Dwr),
  .Rwr (Rwr),
  .Cnt (Cnt),
  .Mux (MuxSel) );

valid V( .clk (clk), .line (line), .reset (reset), 
         .wr (Twr), .dout(v) );

Mtag T( .clk (clk), .line (line),  .din(tag), 
       .wr(Twr), .dout(Tout), .reset(reset) );

comparator comp(.out(c), .tag(tag), .tag_in(Tout));

datacache dcache( .clk (clk), .line (line), .blk(Muxout),
                  .din(Ram2Cache), .wr(Dwr), .dout(Cache2out) );

ramp #(8,11) R ( .clk(clk), .addr({tag,line,Mux1}), .din(din), .wr(Rwr), .dout(Ram2Cache), .reset(reset) );

mux DataMux( .din_0 (blk), .din_1(Mux1), .sel(MuxSel) , .mux_out (Muxout));

counter count(.out(Mux1), .clk(clk), .reset(Cnt), .End(END));


endmodule
