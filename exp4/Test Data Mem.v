//Name:ghidaa falah 
//ID:0199959
module testDM;

reg [31:0] address , writedata ; 
reg memwrite , memread , clk; 
wire [31:0] readdata; 

Data_Memory dm (readdata , address, writedata , memwrite , memread , clk); 
initial begin 
clk=1; writedata='h0;address='h14; memread=0 ;memwrite=0;
#40  writedata='he5;address='h14; memread=1 ;memwrite=0;
#40  writedata='hf14;address='h14; memread=0 ;memwrite=1;
#40  writedata='ha;address='h18; memread=0 ;memwrite=1;
#40  writedata='h9e;address='h14; memread=1 ;memwrite=0;
#40  writedata='h7f;address='h18; memread=1 ;memwrite=0;
#40 $finish;

end
always #20 clk=~clk;
endmodule

