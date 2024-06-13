// name:
//ID:
module FullAdder(Cout, sum, a, b, Cin);
output sum, Cout;
input Cin, a, b;
//module AND (out, in1, in2);
 AND x1(w1, a, b);
 AND x2(w2, a, Cin);
 AND x3(w3, Cin, b);
//module OR3 (out, in1, in2, in3);
 OR3 x4(Cout, w1,w2, w3);
//module XOR3 (out, in1, in2, in3);
 XOR3 x5(sum, a, b, c);


endmodule
