//Name:
//ID:
module ProgramCounter (Q, D, clk, reset, enable);
input clk,reset,enable ;
input  [31:0] D;
output [31:0] Q;
//REG8 (Q, D, clk, reset, enable);
REG8 r1 (Q[7:0], D[7:0], clk, reset, enable);
REG8 r2 (Q[15:8], D[15:8], clk, reset, enable);
REG8 r3 (Q[23:16], D[23:16], clk, reset, enable);
REG8 r4 (Q[31:24], D[31:24], clk, reset, enable);
endmodule 
//////////////////////////////////////////////////////
module IFID (Q, D, clk, reset, enable);
input clk, reset, enable;
input [95:0] D;
output [95:0] Q;
//ProgramCounter (Q, D, clk, reset, enable);
ProgramCounter r1(Q[31:0], D[31:0], clk, reset, enable);
ProgramCounter r2(Q[63:32], D[63:32], clk, reset, enable);
ProgramCounter r3(Q[95:64], D[95:64], clk, reset, enable);


endmodule
//////////////////////////////////////////////////////
module IDEX (Q, D, clk, reset, enable);
input clk, reset, enable;
input [152:0] D;
output [152:0] Q;
//IFID (Q, D, clk, reset, enable);
IFID r1(Q[95:0], D[95:0], clk, reset, enable);
ProgramCounter r2(Q[127:96], D[127:96], clk, reset, enable);
//REG8 r1 (Q[7:0], D[7:0], clk, reset, enable);
REG8 r3 (Q[135:128], D[135:128], clk, reset, enable);
REG8 r4 (Q[143:136], D[143:136], clk, reset, enable);
REG8 r5 (Q[151:144], D[151:144], clk, reset, enable);
// DFF dff1(Q[0], D[0], clk, reset,enable);
 
DFF r6 (Q[152], D[152], clk, reset,enable);




endmodule
//////////////////////////////////////////////////////

module EXMEM (Q, D, clk, reset, enable);
input clk, reset, enable;
input [105:0] D;
output [105:0] Q;
//IFID (Q, D, clk, reset, enable);
IFID r1(Q[95:0], D[95:0], clk, reset, enable);
//REG8 r1 (Q[7:0], D[7:0], clk, reset, enable);
REG8 r2 (Q[103:96], D[103:96], clk, reset, enable);
// DFF dff1(Q[0], D[0], clk, reset,enable);
 
DFF r3 (Q[104], D[104], clk, reset,enable);
DFF r4 (Q[105], D[105], clk, reset,enable);





endmodule
//////////////////////////////////////////////////////
module MEMWB (Q, D, clk, reset, enable);
input clk, reset, enable;
input [103:0] D;
output [103:0] Q;
//IFID (Q, D, clk, reset, enable);
IFID r1(Q[95:0], D[95:0], clk, reset, enable);
//REG8 r1 (Q[7:0], D[7:0], clk, reset, enable);
REG8 r2 (Q[103:96], D[103:96], clk, reset, enable);

endmodule



