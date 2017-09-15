/*
http://iverilog.wikia.com/wiki/Getting_Started

Compile
iverilog -o hello helloworld.v
vvp hello

*/
module main;
  initial 
    begin
      $display("Hello, World");
      $finish ;
    end
endmodule

