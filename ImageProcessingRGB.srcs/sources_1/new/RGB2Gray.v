`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/15 20:55:43
// Design Name: 
// Module Name: RGB2Gray
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


module RGB2Gray(
input i_clk,
input i_rst,
input [7:0]i_data,
input i_data_valid,
output reg [7:0]o_data,
output reg o_data_valid
    );
    
reg [31:0]buffer[5:0];
reg [2:0]cnt;
reg [2:0]set;
reg [7:0]o_dataInt;
reg RGB_data_valid;

always @(posedge i_clk) begin
    if(i_rst) begin
        cnt <= 0;
    end
    else if(cnt == 'd5) begin
        cnt <= 0;
    end
    else if(i_data_valid) begin
        cnt <= cnt + 'd1;
    end
end

always @(posedge i_clk) begin
    if(i_rst) begin
        set <= 0;
    end
    else if(RGB_data_valid && set == 'd0) begin
        set <= 3;
    end
    else if(RGB_data_valid) begin
        set <= 0;
    end
end

// Blue
always @(posedge i_clk) begin
    if(i_data_valid && cnt == 'd0) begin
        buffer[0] <= i_data * 'd30; // (i_data << 5) - (i_data << 1)
        //buffer[0] <= (i_data >> 4) + (i_data >> 5);
    end
    else begin
        buffer[0] <= buffer[0];
     end
end

// Green
always @(posedge i_clk) begin
    if(i_data_valid && cnt == 'd1) begin
        buffer[1] <= i_data * 'd150;
        //buffer[1] <= (i_data >> 1) + (i_data >> 4);
    end
    else begin
        buffer[1] <= buffer[1];
    end
end

// Red
always @(posedge i_clk) begin
    if(i_data_valid && cnt == 'd2) begin
        buffer[2] <= i_data  * 'd76;
        //buffer[2] <= (i_data >> 2) + (i_data >> 5);
    end
    else begin
        buffer[2] <= buffer[2];
    end
end

always @(posedge i_clk) begin
    if(i_data_valid && cnt == 'd3) begin
        buffer[3] <= i_data * 'd30;
        //buffer[3] <= (i_data >> 4) + (i_data >> 5);
    end
    else begin
        buffer[3] <= buffer[3];
    end
end

always @(posedge i_clk) begin
    if(i_data_valid && cnt == 'd4) begin
        buffer[4] <= i_data * 'd150;
        //buffer[4] <= (i_data >> 1) + (i_data >> 4);
    end
    else begin
        buffer[4] <= buffer[4];
    end
end

always @(posedge i_clk) begin
    if(i_data_valid && cnt == 'd5) begin
        buffer[5] <= i_data  * 'd76;
        //buffer[5] <= (i_data >> 2) + (i_data >> 5);
    end
    else begin
        buffer[5] <= buffer[5];
    end
end

always @(posedge i_clk) begin
    if(i_data_valid && (cnt == 'd2 || cnt == 'd5)) begin
        RGB_data_valid <= 1;    
    end
    else begin
        RGB_data_valid <= 0;
    end
end
 

always @(*) begin
    o_dataInt = (buffer[set] + buffer[set+1] + buffer[set+2]) >> 8;
    //o_dataInt = buffer[set] + buffer[set+1] + buffer[set+2];
end

always @(posedge i_clk) begin
    if(RGB_data_valid) begin
        o_data <= o_dataInt;
    end
end

always @(posedge i_clk) begin
    if(RGB_data_valid) begin
        o_data_valid <= 1;
    end
    else begin
        o_data_valid <= 0;
    end
end

endmodule
