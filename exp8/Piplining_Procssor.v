//Name:
//ID:

module PipelinedProcessor(clk, reset, enable);
input clk, reset, enable; 
 
 wire[31:0] PCout , PCin ,instr, ForA,ForB,readdata1 ,readdata2,readdata1e ,readdata2e , SEout ,SEoutshift ,pc4 ,BTA ,outmux2 ,result ,readdata ,mux2to1 ,out ,r1,instrf,pc4f,pc4d,PCoutd,pc4e,SEoute,pc4m,bta,omux1, address,writedatam,pc4w,r1w,addressm,final;
 wire[1:0] pcsrc ,memtoreg,memtorege,memtoregm,memtoregw,ForwardA, ForwardB;
 wire [2:0] aluop,aluope;
 wire [4:0]  IDEX_Rs2, IDEX_Rs1,writerege,writeregm,writeregw;
 
////f

 ProgramCounter PC ( PCout , PCin, clk, reset, enable);
 Adder32bit adder (pc4f, PCout, 4); // for PC + 4
 Instruction_Memory im (PCout, instrf);

 Mux_2_to_1_32bit mux1 (omux1, muxsel1, bta , pc4f);  
 Mux_2_to_1_32bit mux2 (PCin, pcsrc1e, result , omux1); 
 OR3 flush1(Flush1, pcsrc1e, muxsel1, reset);
 IFID fd({pc4d,PCoutd,instr}, {pc4f,PCout,instrf}, clk, Flush1, enable);

///d
 ControlUnit cu(aluop, alusrc, pcsrc, memtoreg, regwrite ,memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR,instr[6:0], instr[14:12], instr[31:25]);
//RegFile(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset);   
 RegFile Freg(readdata1 ,readdata2, instr[19:15], instr[24:20], final,writeregw, regwritew, clk, reset); 
 SignExtend signex (SEout, instr, Iformat, LW, SW, BEQ, JAL, JALR);
 Comparator32bit comp (equal,readdata1 ,readdata2,);
 OR  or1 (muxsel1 , inor,  pcsrc[0]);
 AND and1 (inor, branch, equal);
 ShiftLeft32_by1 shift (SEoutshift, SEout); 
 Adder32bit adder (bta, SEoutshift, PCoutd);
 OR flush2(Flush2, pcsrc1e, reset);
 IDEX dx({pc4e,pcsrc1e,regwritee,memtorege,memwritee,memreade,aluope,alusrce,readdata1e ,readdata2e,SEoute, IDEX_Rs2,IDEX_Rs1,writerege}, {pc4d,pcsrc[1],regwrite,memtoreg,memwrite,memread,aluop,alusrc,readdata1 ,readdata2,SEout,instr[24:20],instr[19:15],instr[11:7]}, clk, Flush2, enable);

////E 
 
 
 ForwardingUnit FU(ForwardA, ForwardB, writeregm, writeregw, IDEX_Rs1, IDEX_Rs2, regwritem, regwritew);
//Mux_2_to_1_32bit(out, s, i1, i0); for the input b of the ALU
  Mux_3_to_1_32bit FORWORDA(ForA,ForwardA ,final ,address ,readdata1e);
  Mux_3_to_1_32bit FORWORDB(ForB,ForwardB ,final ,address ,readdata2e);
// ALU_32(result, a, b, m);
  ALU_32  alu(result, ForA, outmux2, aluope);
  Mux_2_to_1_32bit mux(outmux2, alusrce, SEoute,ForB);
  EXMEM xm({pc4m,regwritem,memtoregm,memwritem,memreadm,address,writedatam,writeregm}, {pc4e,regwritee,memtorege,memwritee,memreade,result,ForB,writerege}, clk, reset, enable);

////mmm
 Data_Memory DM(r1 , address, writedatam, memwritem , memreadm, clk); 

 MEMWB mw({pc4w,regwritew,memtoregw,r1w,addressm,writeregw}, {pc4m,regwritem,memtoregm,r1,address,writeregm}, clk, reset, enable);

/////w
 Mux_3_to_1_32bit muxf(final, memtoregw,pc4w , r1w,addressm);



//ShiftLeft32_by1(out, in); 
//RegFile(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset); 
//Data_Memory(readdata , address, writedata , memwrite , memread , clk); 
//ControlUnit(aluop, alusrc, pcsrc, memtoreg, regwrite ,memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR, opcode, func3, func7);
//SignExtend (SEout, in, Iformat, LW, SW, BEQ, JAL, JALR);                                                                                                                      
//RegFile(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset); 
//Mux_2_to_1_32bit(out, s, i1, i0); for the input b of the ALU
// ALU_32(result, a, b, m); 
// Mux_2_to_1_32bit(out, s, i1, i0); 
//Data_Memory(readdata , address, writedata , memwrite , memread , clk); 



endmodule




