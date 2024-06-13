//Name:
//ID:
module test;
 
reg regwrite, clk, reset; 
reg [4:0]readreg1, readreg2, writereg; 
reg [31:0]writedata; 
wire [31:0]readdata1, readdata2;
RegFile f(readdata1 ,readdata2, readreg1, readreg2, writedata, writereg, regwrite, clk, reset);
initial #200 $finish;
initial begin 
    
 clk=1; writedata='hff;writereg='b11;regwrite=0;readreg1=0;readreg2='b11;reset=1;
#40 writedata='h150;writereg='b11;regwrite=1;readreg1='b11;readreg2='b100;reset=0;
#40 writedata='h66;writereg='b100;regwrite=1;readreg1='b11;readreg2='b100;reset=0;
#40 writedata='h8;writereg='b11;regwrite=0;readreg1='b11;readreg2='b1000;reset=0;
#40 writedata='h40;writereg='b1000;regwrite=0;readreg1='b1;readreg2='b101;reset=0;
end
always #20 clk=~clk;

endmodule
