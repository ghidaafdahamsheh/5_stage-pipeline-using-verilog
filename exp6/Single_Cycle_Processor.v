//Name:
//ID:
 
module Processor(clk, reset, enable); 
 input clk, reset, enable; 
 wire[31:0] PCout , PCin ,instr ,rs1 ,rs2 , SEout ,SEoutshift ,pc4 ,BTA ,outmux2 ,result ,readdata ,mux2to1 ,out ,r1 ;
 wire[1:0] pcsrc ,memtoreg;
 wire [2:0] aluop;

REG32negclk ProgramCounter( PCout , PCin, clk, reset, enable);

 Instruction_Memory im (PCout, instr);

 Adder32bit adder (pc4, PCout, 4); // for PC + 4

 ControlUnit cu(aluop, alusrc, pcsrc, memtoreg, regwrite ,memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR,instr[6:0], instr[14:12], instr[31:25]);   
                                                                                                                          
 SignExtend signex (SEout, instr, Iformat, LW, SW, BEQ, JAL, JALR);

 RegFile Freg(rs1 ,rs2, instr[19:15], instr[24:20], out,instr[11:7], regwrite, clk, reset); 
//RegFile(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset); 

 Mux_2_to_1_32bit mux2 ( mux2to1, alusrc, SEout, rs2); //for the input b of the ALU
 //Mux_2_to_1_32bit(out, s, i1, i0); for the input b of the ALU
Comparator32bit comp (equal, rs1, rs2);

 ALU_32  alu(result, rs1, mux2to1, aluop);
// ALU_32(result, a, b, m); 
 ShiftLeft32_by1 shift(SEoutshift,SEout );

 Adder32bit adder2(BTA, PCout, SEoutshift);// to calculate branch/jal target Address

 AND and1 (equbransh, equal,branch );
// Mux_2_to_1_32bit(out, s, i1, i0); 
 Mux_2_to_1_32bit mux(outmux2, equbransh, BTA, pc4);

 Mux_3_to_1_32bit mux3(PCin, pcsrc, result, BTA, outmux2);

 Data_Memory DM(r1 , result, rs2 , memwrite , memread, clk); 
//Data_Memory(readdata , address, writedata , memwrite , memread , clk); 

 Mux_3_to_1_32bit muxf(out, memtoreg, pc4, r1,result);
endmodule

