module Decoder2to4 (out, in, enable); 
input enable; 
input [1:0]in; 
output [3:0]out; 
 wire [1:0] nin;
 INV n0(nin[0], in[0]);
 INV n1(nin[1], in[1]);  
 AND3 A0(out[0], enable, nin[1], nin[0]);
 AND3 A1(out[1], enable, nin[1], in[0]);
 AND3 A2(out[2], enable, in[1], nin[0]);
 AND3 A3(out[3], enable, in[1], in[0]);

endmodule 

///////////////////////////////////////////////////////////////////

module Decoder3to8 (out, in, enable); 
input enable; 
input [2:0]in; 
output [7:0]out; 

wire [2:0] nin;
 INV n0(nin[0], in[0]);
 INV n1(nin[1], in[1]);  
 INV n2(nin[2], in[2]); 
 AND4 A0(out[0], enable, nin[2],nin[1], nin[0]);
 AND4 A1(out[1], enable, nin[2],nin[1], in[0]);
 AND4 A2(out[2], enable, nin[2],in[1], nin[0]);
 AND4 A3(out[3], enable, nin[2],in[1], in[0]);
 AND4 A4(out[4], enable,  in[2],nin[1], nin[0]);
 AND4 A5(out[5], enable,  in[2],nin[1], in[0]);
 AND4 A6(out[6], enable,  in[2],in[1], nin[0]);
 AND4 A7(out[7], enable,  in[2],in[1], in[0]);



endmodule 

///////////////////////////////////////////////////////////////////

module Decoder5to32 (out, in, enable); 
input enable; 
input [4:0]in; 
output [31:0]out; 
  wire [3:0] W;
  Decoder2to4 D0(W, in[4:3], enable); 
  Decoder3to8 D1(out  [7:0], in[2:0], W[0]);
  Decoder3to8 D3(out [15:8], in[2:0], W[1]);
  Decoder3to8 D4(out[23:16], in[2:0], W[2]);
  Decoder3to8 D5(out[31:24], in[2:0], W[3]);


endmodule 

///////////////////////////////////////////////////////////////////

module RegFile(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset); 
input regwrite, clk, reset; 
input [4:0]readreg1, readreg2, writereg; 
input [31:0]writedata; 
output [31:0]readdata1, readdata2; 
  wire [31:0] W,Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0;
  Decoder5to32 D0(W, writereg,  regwrite); 
  REG32negclk X0(Q0, writedata, clk, reset, 1'b0);
  REG32negclk X1(Q1, writedata, clk, reset, W[1]);
  REG32negclk X2(Q2, writedata, clk, reset, W[2]);
  REG32negclk X3(Q3, writedata, clk, reset, W[3]);
  REG32negclk X4(Q4, writedata, clk, reset, W[4]);
  REG32negclk X5(Q5, writedata, clk, reset, W[5]);
  REG32negclk X6(Q6, writedata, clk, reset, W[6]);
  REG32negclk X7(Q7, writedata, clk, reset, W[7]);
  REG32negclk X8(Q8, writedata, clk, reset, W[8]);
  REG32negclk X9(Q9, writedata, clk, reset, W[9]);
  REG32negclk X10(Q10, writedata, clk, reset, W[10]);
  REG32negclk X11(Q11, writedata, clk, reset, W[11]);
  REG32negclk X12(Q12, writedata, clk, reset, W[12]);
  REG32negclk X13(Q13, writedata, clk, reset, W[13]);
  REG32negclk X14(Q14, writedata, clk, reset, W[14]);
  REG32negclk X15(Q15, writedata, clk, reset, W[15]);
  REG32negclk X16(Q16, writedata, clk, reset, W[16]);
  REG32negclk X17(Q17, writedata, clk, reset, W[17]);
  REG32negclk X18(Q18, writedata, clk, reset, W[18]);
  REG32negclk X19(Q19, writedata, clk, reset, W[19]);
  REG32negclk X20(Q20, writedata, clk, reset, W[20]);
  REG32negclk X21(Q21, writedata, clk, reset, W[21]);
  REG32negclk X22(Q22, writedata, clk, reset, W[22]);
  REG32negclk X23(Q23, writedata, clk, reset, W[23]);
  REG32negclk X24(Q24, writedata, clk, reset, W[24]);
  REG32negclk X25(Q25, writedata, clk, reset, W[25]);
  REG32negclk X26(Q26, writedata, clk, reset, W[26]);
  REG32negclk X27(Q27, writedata, clk, reset, W[27]);
  REG32negclk X28(Q28, writedata, clk, reset, W[28]);
  REG32negclk X29(Q29, writedata, clk, reset, W[29]);
  REG32negclk X30(Q30, writedata, clk, reset, W[30]);
  REG32negclk X31(Q31, writedata, clk, reset, W[31]);
  Mux_32_to_1_32bit M1(readdata1, readreg1, {Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0});
  Mux_32_to_1_32bit M2(readdata2, readreg2, {Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0});



endmodule 








