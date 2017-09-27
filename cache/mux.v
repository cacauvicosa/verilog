
module  mux(
din_0      , // Mux first input
din_1      , // Mux Second input
sel        , // Select input
mux_out      // Mux output
);
//-----------Input Ports---------------
input [2:0] din_0;
inout [2:0] din_1;
input sel ;
//-----------Output Ports---------------
output [2:0] mux_out;
//------------Internal Variables--------
wire  mux_out;
//-------------Code Start-----------------
assign mux_out = (sel) ? din_1 : din_0;

endmodule //End Of Module mux
