module Instruction_Memory(PC, instruction);
	input [31:0] PC; 
	output [31:0] instruction; 
	reg [31:0] instruction; 
	reg [31:0] IM [255:0]; 
	initial begin 
		 IM[0] = 32'h00506113;
		 IM[1] = 32'h00402283;
		 IM[2] = 32'h40510333;
		 IM[3] = 32'h00630333;
		 IM[4] = 32'h006000ef;
		 IM[5] = 32'h32393;
		 IM[6] = 32'h00038263;
		 IM[7] = 32'h00008067;
		 IM[8] = 32'h00032223;
		 IM[9] = 32'h00402403;
		 IM[10] = 32'h44493;
		 IM[11] = 32'h0084f533;



	end 
	always @ (PC ) 
		#15 instruction = IM[PC>>2]; 
endmodule 
