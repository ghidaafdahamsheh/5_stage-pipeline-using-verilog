//Name:ghidaa falah 
//ID:0199959
module testinst;
reg [31:0] PC; 
wire [31:0] instruction; 
Instruction_Memory IM(PC, instruction);
initial begin
    PC=0;
#20  PC='h4;
#20  PC='h8;
#20  PC='hc;
#20  PC='h10;
#20  PC='h14;
#20 ;

end
endmodule


