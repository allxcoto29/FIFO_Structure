`timescale 1ns / 1ps


module ram_8x8b
    (
    input logic clk,
    input logic w_en,
    
    input logic [2:0]  r_addr,
    input logic [2:0]  w_addr,
    input logic [7:0]  w_data,
    output logic [7:0] r_data
    
    );
    
logic [7:0] mem [0:7];

assign r_data = mem[r_addr];

always_ff @(posedge clk) begin
    if(w_en) begin
        mem[w_addr] <= w_data;
    end
end
endmodule
