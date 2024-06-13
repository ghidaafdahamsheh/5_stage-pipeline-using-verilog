//Name:
//ID:

module test_exp7; 
 reg clk, reset, enable; 
 PipelinedProcessor p(clk, reset, enable);

 initial begin : stop_at 
  #(100*18 ); $finish ;
 end 

 initial begin : init 
  reset=1 ; enable=1; clk =1;
  #100 reset=0 ;
 end
 
 always #50 clk=~clk;
endmodule 

