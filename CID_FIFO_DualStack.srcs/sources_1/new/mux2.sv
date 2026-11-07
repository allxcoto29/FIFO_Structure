`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2026 12:19:03 AM
// Design Name: 
// Module Name: mux2
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


module mux2(
    input logic [7:0] in0,
    input logic [7:0] in1,
    input logic sel,
    output logic [7:0] out0
    );
    
always_comb begin
    if(!sel) begin
        out0 = in0;
    end
    else begin
        out0 = in1;
    end
end
endmodule
