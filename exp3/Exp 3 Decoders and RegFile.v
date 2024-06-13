//Name:
//ID:

module Decoder2to4 (out, in, enable); 
input enable; 
input [1:0]in; 
output [3:0]out;
 
INV nott(n0, in[0]);
INV nnt(n1, in[1]);

AND3 a1(out[0], n1, n0,enable);
AND3 a2(out[1], n1, in[0],enable);
AND3 a3(out[2], in[1], n0,enable);
AND3 a4(out[3], in[1], in[0],enable);

endmodule 

///////////////////////////////////////////////////////////////////

module Decoder3to8 (out, in, enable); 
input enable; 
input [2:0]in; 
output [7:0]out;
 
INV nott1(n0, in[0]);
INV nott2(n1, in[1]);
INV nott3(n2, in[2]);

AND4 a1(out[0],n2, n1, n0,enable);
AND4 a2(out[1],n2, n1, in[0],enable);
AND4 a3(out[2],n2, in[1], n0,enable);
AND4 a4(out[3],n2, in[1], in[0],enable);
AND4 a4(out[4],in[2], n1, n0,enable);
AND4 a4(out[5],in[2], n1, in[0],enable);
AND4 a4(out[6],in[2], in[1], n0,enable);
AND4 a4(out[7],in[2], in[1], in[0],enable);



endmodule 

///////////////////////////////////////////////////////////////////

module Decoder5to32 (out, in, enable); 
input enable; 
input [4:0]in; 
output [31:0]out;
wire [3:0] w; 

Decoder2to4 D(w, in[4:3], enable); 

Decoder3to8 d1(out[7:0], in[2:0], w[0]); 
Decoder3to8 d1(out[15:8], in[2:0], w[1]); 
Decoder3to8 d1(out[23:16], in[2:0], w[2]); 
Decoder3to8 d1(out[31:24], in[2:0], w[3]); 



  

endmodule 

///////////////////////////////////////////////////////////////////

module RegFile(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset); 
input regwrite, clk, reset; 
input [4:0]readreg1, readreg2, writereg; 
input [31:0]writedata; 
output [31:0]readdata1, readdata2;
wire [31:0]w; 
wire [1023:0]Q;

Decoder5to32 D1(w, writereg ,regwrite); 

REG32negclk r1 (Q[31:0],writedata , clk, reset, w[0]);
REG32negclk r2 (Q[63:32],writedata , clk, reset, w[1]);
REG32negclk r3 (Q[95:64],writedata , clk, reset, w[2]);
REG32negclk r4 (Q[127:96],writedata , clk, reset, w[3]);
REG32negclk r5 (Q[159:128],writedata , clk, reset, w[4]);
REG32negclk r6 (Q[191:160],writedata , clk, reset, w[5]);
REG32negclk r7 (Q[223:192],writedata , clk, reset, w[6]);
REG32negclk r8 (Q[255:224],writedata , clk, reset, w[7]);
REG32negclk r9 (Q[287:256],writedata , clk, reset, w[8]);
REG32negclk r10 (Q[319:288],writedata , clk, reset, w[9]);
REG32negclk r11 (Q[351:320],writedata , clk, reset, w[10]);
REG32negclk r12 (Q[383:352],writedata , clk, reset, w[11]);
REG32negclk r13 (Q[415:384],writedata , clk, reset, w[12]);
REG32negclk r14 (Q[447:416],writedata , clk, reset, w[13]);
REG32negclk r15 (Q[479:448],writedata , clk, reset, w[14]);
REG32negclk r16 (Q[511:480],writedata , clk, reset, w[15]);
REG32negclk r17 (Q[543:512],writedata , clk, reset, w[16]);
REG32negclk r18 (Q[575:544],writedata , clk, reset, w[17]);
REG32negclk r19 (Q[607:576],writedata , clk, reset, w[18]);
REG32negclk r20 (Q[639:608],writedata , clk, reset, w[19]);
REG32negclk r21 (Q[671:640],writedata , clk, reset, w[20]);
REG32negclk r22 (Q[703:672],writedata , clk, reset, w[21]);
REG32negclk r23 (Q[735:704],writedata , clk, reset, w[22]);
REG32negclk r24 (Q[767:736],writedata , clk, reset, w[23]);
REG32negclk r25 (Q[799:768],writedata , clk, reset, w[24]);
REG32negclk r26 (Q[831:800],writedata , clk, reset, w[25]);
REG32negclk r27 (Q[863:832],writedata , clk, reset, w[26]);
REG32negclk r28 (Q[895:864],writedata , clk, reset, w[27]);
REG32negclk r29 (Q[927:896],writedata , clk, reset, w[28]);
REG32negclk r30 (Q[959:928],writedata , clk, reset, w[29]);
REG32negclk r31 (Q[991:960],writedata , clk, reset, w[30]);
REG32negclk r32 (Q[1023:992],writedata , clk, reset, w[31]);


Mux_32_to_1_32bit M1(readdata2, readreg2, Q); 
Mux_32_to_1_32bit M2(readdata1, readreg1, Q); 



endmodule 







