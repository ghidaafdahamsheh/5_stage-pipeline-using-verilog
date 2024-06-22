//Name:
//ID:

module test_exp10; 
 reg clk, reset, enable; 
 PipelinedProcessor p(clk, reset, enable);

 initial begin : stop_at 
 #(120*27 ); $finish ;

 end 

 initial begin : init 
  reset=1 ; enable=1; clk =1;
  #120 reset=0 ;

 end
 
 always #60 clk=~clk;

endmodule 

