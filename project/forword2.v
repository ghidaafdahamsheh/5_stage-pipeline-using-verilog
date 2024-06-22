
// Name:
// ID:

module Comparator5bit (equal, a, b);
input [4:0] a, b;
output equal;
XNOR xnor1 (w1, a[0], b[0]);
XNOR xnor2 (w2, a[1], b[1]);
XNOR xnor3 (w3, a[2], b[2]);
XNOR xnor4 (w4, a[3], b[3]);
XNOR xnor5 (w5, a[4], b[4]);

AND5 full (equal, w1, w2, w3, w4, w5);

endmodule 
//////////////////////////////////////////////////////

module ForwardingUnitDecoder(ForwardA, ForwardB, EXMEM_Rd, MEMWB_Rd, FD_Rs1, FD_Rs2, EXMEM_RegWrite, MEMWB_RegWrite, EXMEM_Prcsr, MEMWB_Prcsr ,EXMEM_memtoreg0,branch);//, EXMEM_Prcsr, MEMWB_Prcsr 2bit size FD_Rs1 +FD_Rs2

input [4:0] EXMEM_Rd, MEMWB_Rd, FD_Rs1, FD_Rs2;
input EXMEM_RegWrite, MEMWB_RegWrite,EXMEM_memtoreg0, branch ;
input [1:0]EXMEM_Prcsr, MEMWB_Prcsr;
output [1:0] ForwardA, ForwardB ;


OR8 OR1(w0, EXMEM_Rd[0], EXMEM_Rd[1], EXMEM_Rd[2], EXMEM_Rd[3], EXMEM_Rd[4], 1'b0, 1'b0,1'b0);
OR8 OR2(w1, MEMWB_Rd[0], MEMWB_Rd[1], MEMWB_Rd[2], MEMWB_Rd[3], MEMWB_Rd[4], 1'b0, 1'b0,1'b0);

//Comparator5bit (equal, a, b);
Comparator5bit COMP1(MEM_RS1, EXMEM_Rd,FD_Rs1);
Comparator5bit COMP2(WB_RS1, MEMWB_Rd,FD_Rs1);

INV NOTA (NOTA0, ForwardA[0]);

INV notEXMEM_memtoreg0 ( NEXMEM_memtoreg0 , EXMEM_memtoreg0 );

INV notMEMWB_Prcsr0 (NMEMWB_Prcsr0, MEMWB_Prcsr[0]);
INV notMEMWB_Prcsr1 (NMEMWB_Prcsr1, MEMWB_Prcsr[1]);

INV notEXMEM_Prcsr0 (NEXMEM_Prcsr0, EXMEM_Prcsr[0]);
INV notEXMEM_Prcsr1 (NEXMEM_Prcsr1, EXMEM_Prcsr[1]);

AND8 A0(ForwardA[0],MEM_RS1, w0, EXMEM_RegWrite,NEXMEM_Prcsr0,NEXMEM_Prcsr1,NEXMEM_memtoreg0,branch,1'b1);
AND8 A1(ForwardA[1],WB_RS1, w1, MEMWB_RegWrite,NOTA0,NMEMWB_Prcsr0,NMEMWB_Prcsr1,branch,1'b1);


Comparator5bit COMP3(MEM_RS2, EXMEM_Rd,FD_Rs2);
Comparator5bit COMP4(WB_RS2, MEMWB_Rd,FD_Rs2);

INV NOTB(NOTB0, ForwardB[0]);

AND8 B0(ForwardB[0],MEM_RS2, w0, EXMEM_RegWrite,NEXMEM_Prcsr0,NEXMEM_Prcsr1,NEXMEM_memtoreg0,branch,1'b1);
AND8 B1(ForwardB[1],WB_RS2, w1, MEMWB_RegWrite,NOTB0,NMEMWB_Prcsr0,NMEMWB_Prcsr1,branch,1'b1);





//OR8 (out, in1, in2, in3, in4, in5, in6, in7, in8);
//INV (out, in);
//AND4 (out, in1, in2, in3, in4);
//AND3 (out, in1, in2, in3);
endmodule

module AND8 (out, in1, in2, in3, in4, in5,in6,in7,in8);
   input in1, in2, in3, in4,in5,in6,in7,in8;
   output out;
   assign #1 out =  (in1 & in2 & in3 & in4 & in5 & in6 & in7 & in8 );
endmodule

module AND5 (out, in1, in2, in3, in4, in5);
   input in1, in2, in3, in4,in5;
   output out;
   assign #1 out =  (in1 & in2 & in3 & in4 & in5);
endmodule








