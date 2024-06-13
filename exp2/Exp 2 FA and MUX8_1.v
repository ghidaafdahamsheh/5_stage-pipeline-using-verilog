module FullAdder(Cout, sum, a, b, Cin); 
output sum, Cout; 
input Cin, a, b; 
/* AND a1(w1, a, b);
 AND a2(w2, a, Cin);
 AND a3(w3, b, Cin);

 OR3 a4(Cout, w1, w2, w3);


 XOR3 a5(sum, a, b, Cin);*/
 assign #4 sum=a^b^Cin;
 assign #4 Cout=Cin&a|Cin&b|a&b;

endmodule 

///////////////////////////////////////////////////////////////////
module Mux_8_to_1(result, s,in);
  output result;
  input [2:0] s;
  input [7:0] in;
 INV n1(s0, s[0]);
 INV n2(s1, s[1]);
 INV n3(s2, s[2]);

  




AND4 a1(w1, in[0], s2, s1,s0);
AND4 a2(w2, in[1], s2,  s1, s[0]);
AND4 a3(w3, in[2], s2,  s[1], s0);
AND4 a4(w4, in[3], s2,  s[1], s[0]);
AND4 a5(w5, in[4], s[2], s1, s0);
AND4 a6(w6, in[5], s[2], s1, s[0]);
AND4 a7(w7, in[6], s[2], s[1], s0);
AND4 a8(w8, in[7], s[2], s[1],s[0]);



OR8 o1(result, w1, w2, w3, w4, w5, w6, w7, w8);



endmodule 
