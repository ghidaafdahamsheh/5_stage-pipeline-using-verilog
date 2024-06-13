module  testcontrol;
 reg [6:0] opcode, func7; 
 reg [2:0] func3;
 wire [2:0] aluop;
 wire alusrc;
 wire [1:0] pcsrc, memtoreg;
 wire regwrite, memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR;
 ControlUnit CU(aluop, alusrc, pcsrc, memtoreg, regwrite ,memread, memwrite, branch, Iformat, LW, SW, BEQ, JAL, JALR, opcode, func3, func7);		
 initial begin 
      opcode= 7'b0110011; func3= 3'b110; func7= 7'b0;
  #15                     func3= 3'b111;
  #15                     func3= 3'b100;
  #15                     func3= 3'b000;
  #15                     func3= 3'b010;
  #15                     func3= 3'b000; func7= 7'b0100000;
  #15 opcode= 7'b0010011; func3= 3'b110; 
  #15                     func3= 3'b111;
  #15                     func3= 3'b100;
  #15                     func3= 3'b000;
  #15                     func3= 3'b010;
  #15 opcode= 7'b0000011; func3= 3'b010; 
  #15 opcode= 7'b0100011; func3= 3'b010; 
  #15 opcode= 7'b1100011; func3= 3'b000; 
  #15 opcode= 7'b1101111;  
  #15 opcode= 7'b1100111; 
  #15; $finish;
end
endmodule









