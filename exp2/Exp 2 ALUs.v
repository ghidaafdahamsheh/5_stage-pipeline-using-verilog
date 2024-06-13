module ALU_1(result, sum, Cout, Cin, a, b, less, m); 
output result, sum, Cout; 
input Cin, a, b, less; 
input [2:0] m; 
wire w1,w2,w3,w4,w6,w7;
OR o1(w1, a, b);
AND a1(w2,a, b);
XOR x1(w3, a, b);
XOR x2(w4, m[2], b);
FullAdder f1(Cout, sum, a, w4, Cin);
NOR n1(w6, a, b); 
NAND n2(w7, a, b);
Mux_8_to_1  m1(result,m,{sum,less,w7,w6,sum,w3,w2,w1});

endmodule 

///////////////////////////////////////////////////////////////////

module ALU_8(result, sum, Cout, Cin, a, b, less, m);
  output [7:0]result, sum;
  output Cout;
  input  Cin;
  input  [7:0]a, b, less;
  input  [2:0] m;
  wire [6:0]w;
ALU_1 a1(result[0], sum[0], w[0], Cin , a[0], b[0], less[0], m); 
ALU_1 a2(result[1], sum[1], w[1], w[0], a[1], b[1], less[1], m); 
ALU_1 a3(result[2], sum[2], w[2], w[1], a[2], b[2], less[2], m); 
ALU_1 a4(result[3], sum[3], w[3], w[2], a[3], b[3], less[3], m); 
ALU_1 a5(result[4], sum[4], w[4], w[3], a[4], b[4], less[4], m); 
ALU_1 a6(result[5], sum[5], w[5], w[4], a[5], b[5], less[5], m); 
ALU_1 a7(result[6], sum[6], w[6], w[5], a[6], b[6], less[6], m); 
ALU_1 a8(result[7], sum[7], Cout, w[6], a[7], b[7], less[7], m); 
 

endmodule

///////////////////////////////////////////////////////////////////

module ALU_32(result, a, b, m); 
output [31:0]result; 
input [31:0]a, b; 
input [2:0] m; 
wire [3:0]w ;
wire [31:0]sum;
ALU_8 a1(result[7:0],   sum[7:0],   w[0], m[2], a[7:0],   b[7:0],   {7'b0,sum[31]} , m);
ALU_8 a2(result[15:8],  sum[15:8],  w[1], w[0], a[15:8],  b[15:8],      8'b0       , m);
ALU_8 a3(result[23:16], sum[23:16], w[2], w[1], a[23:16], b[23:16],     8'b0       , m);
ALU_8 a4(result[31:24], sum[31:24], w[3], w[2], a[31:24], b[31:24],     8'b0       , m);


endmodule 

