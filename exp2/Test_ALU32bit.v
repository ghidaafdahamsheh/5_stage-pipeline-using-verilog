//Name:
//ID:
module test_ALU32;

wire [31:0]result; 
reg [31:0]a, b; 
reg [2:0] m; 
 ALU_32 ad(result, a, b, m); 
initial begin 
     a=32'h102 ;b='hc0f ;m=0;
#100 m=1;
#100 m=2;
#100 m=4;
#100 m=5;
#100 m=6;
#100 a='hf0001;b='h24;
#100 m=3;
#100 m=7;
end
endmodule
