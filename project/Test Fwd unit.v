//Name:
//ID:
module TeatFWD;

reg [4:0] EXMEM_Rd, MEMWB_Rd, IDEX_Rs1, IDEX_Rs2;
reg EXMEM_RegWrite, MEMWB_RegWrite;
wire [1:0] ForwardA, ForwardB;
ForwardingUnit FWD (ForwardA, ForwardB, EXMEM_Rd, MEMWB_Rd, IDEX_Rs1, IDEX_Rs2, EXMEM_RegWrite, MEMWB_RegWrite);
initial begin 
     EXMEM_Rd=1;MEMWB_Rd=1;IDEX_Rs1=1; IDEX_Rs2= 1;EXMEM_RegWrite=0;MEMWB_RegWrite=0;
#10  EXMEM_Rd=1;MEMWB_Rd=3;IDEX_Rs1=1; IDEX_Rs2= 0;EXMEM_RegWrite=1;MEMWB_RegWrite=0;
#10  EXMEM_Rd=1;MEMWB_Rd=1;IDEX_Rs1=1; IDEX_Rs2= 1;EXMEM_RegWrite=0;MEMWB_RegWrite=1;
#10  EXMEM_Rd=3;MEMWB_Rd=2;IDEX_Rs1=5; IDEX_Rs2= 2;EXMEM_RegWrite=1;MEMWB_RegWrite=1;
#10  EXMEM_Rd=5;MEMWB_Rd=5;IDEX_Rs1=5; IDEX_Rs2= 6;EXMEM_RegWrite=1;MEMWB_RegWrite=1;
#10 $finish;

end
endmodule

