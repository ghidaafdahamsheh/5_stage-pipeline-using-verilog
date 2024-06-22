module ControlUnit(aluop, alusrc, pcsrc, memtoreg, regwrite ,memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR, opcode, func3, func7);
  input [6:0] opcode, func7; 
  input [2:0] func3;
  output [2:0] aluop;
  output [1:0] memtoreg, pcsrc;
  output alusrc, regwrite, memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR;	
  wire Rformat;  	
assign #2 SW=~opcode[6]&opcode[5]&~opcode[4];
assign #2 LW=~opcode[6]&~opcode[5]&~opcode[4];
assign #2 Rformat=~opcode[6]&opcode[5]&opcode[4];
assign #2 Iformat=~opcode[6]&~opcode[5]&opcode[4];

assign #2 BEQ=opcode[6]&~opcode[2];
assign #2 JAL=opcode[6]&opcode[3];
assign #2 JALR=opcode[6]&opcode[2]&~opcode[3]&~opcode[4];

assign #4 alusrc=Iformat|LW|SW|JALR;

assign  #2pcsrc[1]=JALR;
assign  #2pcsrc[0]=JAL;

assign #4 memtoreg[1]=JAL|JALR;
assign #2 memtoreg[0]=LW;

assign #4 regwrite=Iformat|Rformat|LW|JAL|JALR;

assign #2 memread=LW;
assign #2 memwrite=SW;

assign #2 branch=BEQ;

assign #4 aluop[2]=Rformat&((~func3[2]&func3[1])|func7[5])|Iformat&(~func3[2]&func3[1]);
assign #4 aluop[1]=(Rformat|Iformat)&(~func3[0]&~func3[1]&~func3[2]|~func3[2]&func3[1]|func3[2]&~func3[1])|LW|SW|JALR;
assign #4 aluop[0]= (Rformat|Iformat) & (func3[0]&func3[1]&func3[2]|~func3[0]&~func3[1]&~func3[2]) | LW | SW | JALR;


endmodule
