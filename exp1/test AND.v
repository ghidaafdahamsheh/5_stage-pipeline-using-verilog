// Name:
// ID:
module test;
reg [1:0]in;
wire out;

AND a1(out,in);

initial #100 $finish;
always #10 in[0]=~in[0];
always #20 in[1]=~in[1] ;

initial begin 
in[0]=0;
in[1]=0;
end

endmodule 
