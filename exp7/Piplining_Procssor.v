//Name:
//ID:


module PipelinedProcessor(clk, reset, enable);
input clk, reset, enable; 
 wire[31:0] pcout,pcin,instruction,instructionF,PCplus4,PCplus4_D,pcout_D,outMUX1,SEout,readdata1,readdata2,outmuxBAlu,result,outtarget,out0,readdata,writedata,outShift,PCplus4_M,result_M,readdata2_M,PCplus4_WB;
 wire[31:0] readdata1_E,readdata2_E,SEout_E,readdata_WB,result_WB,outPCplus4_E;
 wire [2:0] aluop,aluop_E;
 wire[1:0] pcsrc,memtoreg,memtoreg_E,memtoreg_M,memtoreg_WB;
 wire[4:0] Rd_WB,rs2,rs1,Rd,Rd_M;
////f
  ProgramCounter ProgCounter(pcout, pcin, clk, reset, enable);
 //Instruction_Memory(PC, instruction);
  Instruction_Memory IM(pcout, instructionF);
 //Adder32bit (out, a, b);  for PC + 4
  Adder32bit pcplus4(PCplus4, pcout,4);
 // Mux_2_to_1_32bit(out, s, i1, i0); 
  Mux_2_to_1_32bit MUX1(outMUX1, outOr, outtarget, PCplus4); 
 //Mux_2_to_1_32bit(out, s, i1, i0);
  Mux_2_to_1_32bit MUX2(pcin, pcsrc_E, result, outMUX1);
 //IFID (Q, D, clk, reset, enable);
  IFID RegF_D({PCplus4_D,pcout_D,instruction},{PCplus4,pcout,instructionF}, clk, reset, enable);
 //ControlUnit(aluop, …, JALR, opcode, func3, func7);
  ControlUnit CU(aluop, alusrc, pcsrc, memtoreg, regwrite ,memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR,instruction[6:0], instruction[14:12], instruction[31:25]);                                                                                                                                  
 //SignExtend (SEout, instruction, Iformat, LW, SW, BEQ, JAL, JALR);
  SignExtend extendTo32(SEout, instruction, Iformat, LW, SW, BEQ, JAL, JALR);
 //RegFile(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset); 
  RegFile Registers(readdata1 ,readdata2,instruction[19:15], instruction[24:20], writedata, Rd_WB, regwrite_WB, clk, reset); 
 //ShiftLeft32_by1(out, in);
  ShiftLeft32_by1 Shiftleft(outShift, SEout);
 //Adder32bit (out, a, b); to calculate branch/jal target Address
  Adder32bit AdderOfJandB(outtarget, pcout_D, outShift);
 //Comparator32bit (equal, a, b);
  Comparator32bit comperAB(equal, readdata1,readdata2);
 //AND (out, in1, in2);
  AND andd(outand, equal, branch);
 //OR (out, in1, in2);
  OR OrG(outOr, pcsrc[0], outand);
 //IDEX (Q, D, clk, reset, enable);

  IDEX REG22({PCplus4_E,pcsrc_E,regwrite_E,memtoreg_E,memwrite_E,memread_E,aluop_E,alusrc_E,readdata1_E,readdata2_E,SEout_E,rs2,rs1,Rd}, {PCplus4_D,pcsrc[1],regwrite,memtoreg,memwrite,memread,aluop,alusrc,readdata1,readdata2,SEout,instruction[24:20],instruction[19:15],instruction[11:7]}, clk, reset, enable);

 //Mux_2_to_1_32bit(out, s, i1, i0); for the input b of the ALU
  Mux_2_to_1_32bit inputBofalu(outmuxBAlu, alusrc_E, SEout_E, readdata2_E);
 //ALU_32(result, a, b, m);
  ALU_32 ALU32bit(result, readdata1_E,outmuxBAlu, aluop_E);
 //EXMEM (Q, D, clk, reset, enable);
  EXMEM REG33 ({PCplus4_M,regwrite_M,memtoreg_M,memwrite_M,memread_M,result_M,readdata2_M,Rd_M}, {PCplus4_E,regwrite_E,memtoreg_E,memwrite_E,memread_E,result,readdata2_E,Rd}, clk, reset, enable);
 //Data_Memory(readdata , address, writedata , memwrite , memread , clk); 
  Data_Memory DM(readdata , result_M, readdata2_M , memwrite_M , memread_M , clk);
 //MEMWB (Q, D, clk, reset, enable);
  MEMWB REG44({PCplus4_WB,regwrite_WB,memtoreg_WB,readdata_WB,result_WB,Rd_WB},{PCplus4_M,regwrite_M,memtoreg_M,readdata,result_M,Rd_M}, clk, reset, enable);
 //Mux_3_to_1_32bit(out, s, i2, i1, i0);
  Mux_3_to_1_32bit CC(writedata, memtoreg_WB, PCplus4_WB, readdata_WB, result_WB);


endmodule
