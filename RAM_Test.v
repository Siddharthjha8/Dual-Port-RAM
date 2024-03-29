`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2024 21:45:20
// Design Name: 
// Module Name: RAM_Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RAM_Test;
reg clk,write_enable,read_enable;
reg [9:0] write_addr,read_addr ;
reg [15:0] write_data;
wire [15:0] read_data;

RAM r1(clk,write_data,write_enable,write_addr,read_enable,read_addr,read_data);
integer i;
initial
begin
clk=0;write_enable=0;read_enable=0;
#10;
for(i=0;i<1000;i=i+1)
begin @(posedge clk);#1;
write_addr=$random;
end
#10 $finish();
end

initial
begin
#10;
for(i=0;i<1000;i=i+1)
begin @(posedge clk);#1;
read_addr=$random;
end
#10 $finish();
end
initial
begin
#10;
for(i=0;i<1000;i=i+1)
begin @(posedge clk);#1;
write_enable=$random;
read_enable=$random;
end
#10 $finish();
end
initial
begin
#10;
for(i=0;i<1000;i=i+1)
begin @(posedge clk);#1;
write_data=$random;
end
#10 $finish();
end
initial
begin
clk=0;
forever #1 clk=~clk;
end
initial
begin
$monitor("input address=%d,input data=%d,output address=%d,output data=%d",write_addr,write_data,read_addr,read_data);
end
endmodule
