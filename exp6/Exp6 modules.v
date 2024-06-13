//Name:
//ID:

module Adder32bit (out, a, b); 
input [31:0] a, b; 
output [31:0] out; 

assign #50 out=a+b;

endmodule 
//////////////////////////////////////////////////////
module SignExtend (SEout, in, Iformat, LW, SW, BEQ, JAL, JALR);
input [31:0] in;
input Iformat, LW, SW, BEQ, JAL, JALR;
output [31:0] SEout;

reg [31:0] SEout;

always @(in)
begin
#3;
if (Iformat || LW || JALR)
SEout={{20{in[31]}},in[31:20]};

else if (SW )
SEout={{20{in[31]}},in[31:25],in[11:7]};

else if (JAL)
SEout={{13{in[31]}},in[19:12],in[20],in[30:21]};

else if (BEQ)
SEout={{21{in[31]}},in[7],in[30:25],in[11:8]};




end

endmodule 
//////////////////////////////////////////////////////
module Comparator32bit (equal, a, b); 
input [31:0] a, b; 
output equal; 
reg equal; 

always @ (a or b)

begin
#10;
   if ( a == b)
     equal=1;
    else
     equal=0;       
end

endmodule 
//////////////////////////////////////////////////////
module ShiftLeft32_by1(out, in); 
input [31:0] in; 
output [31:0] out; 

assign out=in<<2;

endmodule 
//////////////////////////////////////////////////////
module Mux_3_to_1_32bit(out, s, i2, i1, i0); 
 input [31:0] i2, i1, i0; 
 input [1:0]s; 
 output [31:0]out; 
 reg [31:0]out; 
 always @ (s or  i2 or i1 or i0)
 begin
 #6;
    case (s)
    2'b00:out=i0;
    2'b01:out=i1;
    2'b10:out=i2;
    default:out=0;

 endcase
end
endmodule 
//////////////////////////////////////////////////////
module Mux_2_to_1_32bit(out, s, i1, i0); 
input [31:0] i1, i0; 
input s; 
output [31:0]out; 
reg [31:0]out; 
 always @ (s  or i1 or i0)

 begin
 #6;
    case (s)
    1'b0:out=i1;
    1'b1:out= i0;
 endcase
 end



endmodule 






