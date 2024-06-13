//Name:
//ID:

module test; 
 reg clk, reset, enable; 
Processor pros(clk, reset, enable); 
 

 initial begin : stop_at 
  #(3250 ); $finish ;
 end 

 initial begin : init 
  reset=1 ; enable=1; clk =1;
  #250 reset=0 ;
 end
 
 always #125 clk=~clk;
endmodule 

