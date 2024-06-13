//Name:
//ID:

module test_exp8; 
 reg clk, reset, enable; 
 PipelinedProcessor p(clk, reset, enable);

 initial begin : stop_at 
 //#(120*14 ); $finish ;
#(100*18 ); $finish ;
 end 

 initial begin : init 
  reset=1 ; enable=1; clk =1;
  //#120 reset=0 ;
  #100 reset=0 ;
 end
 
 //always #60 clk=~clk;
always #50 clk=~clk;
endmodule 

