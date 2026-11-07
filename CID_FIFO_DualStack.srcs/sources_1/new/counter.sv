`timescale 1ns / 1ps

module counter
    (
    input logic        clk,
    input logic        en,
    input logic        rst_n,
    input logic        up,
    
    output logic [3:0] out 
    );

always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        out <= 0;
    end
    else if(en) begin
        if(up) begin
            out <= out + 1;
        end
        else begin
            out <= out - 1;
        end
    end
    else begin
        out <= out; 
    end
end
endmodule
