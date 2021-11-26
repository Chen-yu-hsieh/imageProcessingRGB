`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 23:24:15
// Design Name: 
// Module Name: LineBuffer
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


module LineBuffer(
input i_clk,
input i_rst,
input [7:0]i_data,
input i_data_valid,
output [23:0]o_data,
input i_rd_data
    );
    
reg [7:0]line [511:0];
reg [8:0]wrPtr,rdPtr;
 
assign o_data = {line[rdPtr],line[rdPtr + 1],line[rdPtr + 2]};
    
 always@(posedge i_clk) begin
    if(i_data_valid)begin
        line[wrPtr] <= i_data;
    end
 end
 
 always@(posedge i_clk) begin
    if(i_rst) begin
        wrPtr <= 'd0;
    end
    else if(i_data_valid) begin
        wrPtr <= wrPtr + 'd1;
    end
 end
 
 always@(posedge i_clk) begin
    if(i_rst) begin
        rdPtr <= 'd0;
    end
    else if(i_rd_data) begin
        rdPtr <= rdPtr + 'd1;
    end
 end
 
endmodule
