`timescale 1ns / 1ps

module fsm
    (
    input logic  clk,
    input logic  rst_n,
    input logic  s1_empty,
    input logic  s1_full,
    input logic  s2_empty,
    
    output logic s1_pop,
    output logic s2_pop
    );
    
localparam Q0_incarcare = 2'b00;
localparam Q1_mutare    = 2'b01;
localparam Q2_output    = 2'b10;

logic [1:0] state;
logic [1:0] state_next;

always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        state <= Q0_incarcare;
    end
    else begin
        state <= state_next;
    end
end

always_comb begin
    state_next = state;
    case(state)
        Q0_incarcare: begin
            if(s1_full) state_next = Q1_mutare;
        end
        Q1_mutare: begin
            if(s1_empty) state_next = Q2_output;
        end
        Q2_output: begin
            if(s2_empty) state_next = Q0_incarcare;
        end
    endcase

end

assign s1_pop = (state == Q1_mutare) && !s1_empty;
assign s2_pop = (state == Q2_output) && !s2_empty;

endmodule
