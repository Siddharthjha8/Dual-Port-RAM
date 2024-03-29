`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2024 21:21:14
// Design Name: 
// Module Name: RAM
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


module RAM(clk,write_data,write_enable,write_addr,read_enable,read_addr,read_data);
input clk;
input write_enable,read_enable;
input  [15:0] write_data;
input [9:0] write_addr,read_addr ;
output reg [15:0] read_data;
reg [15:0]RAM[1023:0];
always@(posedge clk)
begin
if(write_enable)
begin
RAM[write_addr]<=write_data;
end
end

always@(posedge clk)
begin
if(read_enable)
begin
read_data=RAM[read_addr];
end
end
endmodule
