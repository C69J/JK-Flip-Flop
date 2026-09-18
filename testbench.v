`timescale 1ns / 1ps


module testbench( );
  reg j,k,clk,reset;
  wire q,qn;
  jkflipflop dut(.j(j), .k(k), .q(q), .qn(qn), .clk(clk), .reset(reset));
   initial
   begin
    forever 
       begin
           clk<=0;
           #100;
           clk<=1;
           #100;
        end 
        
        
   end
   initial  begin
     reset=1; j=1 ;k=0; 
     #100;
     reset=0; j=0; k=0; 
     #100;
     reset=0; j=1; k=0; 
     #100;
     reset=0; j=0; k=0; 
     #100;
   end
endmodule
