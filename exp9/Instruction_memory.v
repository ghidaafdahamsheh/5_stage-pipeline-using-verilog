module Instruction_Memory(PC, instruction);
	input [31:0] PC; 
	output [31:0] instruction; 
	reg [31:0] instruction; 
	reg [31:0] IM [255:0]; 
	initial begin 
		 IM[0] = 32'h00402083;
		 IM[1] = 32'h00c02103;
		 IM[2] = 32'h01402183;
		 IM[3] = 32'h01c02203;
		 IM[4] = 32'h0020f2b3;
		 IM[5] = 32'h3ff1e313;
		 IM[6] = 32'h40220433;
		 IM[7] = 32'h010000ef;
		 IM[8] = 32'h0062c3b3;
		 IM[9] = 32'h00702423;
               IM[10] = 32'h00440a63;
		 IM[11] = 32'h00340413;
		 IM[12] = 32'h00502423;
               IM[13] = 32'h00602c23;
               IM[14] = 32'h00008067;
               IM[15] = 32'h403404b3;
               IM[16] = 32'h40044a533;



	end 
	always @ (PC ) 
		#15 instruction = IM[PC>>2]; 
endmodule 
