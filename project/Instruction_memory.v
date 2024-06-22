module Instruction_Memory(PC, instruction);
	input [31:0] PC; 
	output [31:0] instruction; 
	reg [31:0] instruction; 
	reg [31:0] IM [255:0]; 
	initial begin 
		 IM[0] = 32'h02002283;
		 IM[1] = 32'h01002303;
		 IM[2] = 32'h03002383;
		 IM[3] = 32'h0062e433;
		 IM[4] = 32'h00400493;
		 IM[5] = 32'h00740a63;
		 IM[6] = 32'h00402a03;
		 IM[7] = 32'h00102a93;
		 IM[8] = 32'h01502623;
		 IM[9] = 32'h014a8463;
               IM[10] = 32'hFe9308e3;
		 IM[11] = 32'h00c38863;
		 IM[12] = 32'h0063fb13;
               IM[13] = 32'h41640b33;
               IM[14] = 32'h00628033;
               IM[15] = 32'h005b0463;
               IM[16] = 32'h00a06513;
               IM[17] = 32'hFe700ce3;
               IM[18] = 32'h0062f433;


	end 
	always @ (PC ) 
		#15 instruction = IM[PC>>2]; 
endmodule 
