// Name:
// ID:
module AND(out,in);
input [1:0]in;
output out;

NAND a1 (w, in[0], in[1]);
NAND a2(out, w, w);

endmodule

