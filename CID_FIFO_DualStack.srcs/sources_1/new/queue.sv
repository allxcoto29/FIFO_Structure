`timescale 1ns / 1ps


module queue
    (
    input logic        clk,
    input logic        rst_n,
    input logic        save_data,
    input logic [7:0]  w_data,
    
    output logic [7:0] r_data
    );
logic FSM_0_X_S1_POP;
logic FSM_0_X_S2_POP;
logic STACK_0_X_EMPTY;
logic STACK_0_X_FULL;
logic STACK_1_X_EMPTY;
logic [7:0] STACK_0_X_R_DATA;
  
stack_8x8b STACK_0
    (
    .clk(clk),
    .rst_n(rst_n),
    .pop(FSM_0_X_S1_POP),
    .push(save_data),
    .w_data(w_data),
    .empty(STACK_0_X_EMPTY),
    .full(STACK_0_X_FULL),
    .r_data(STACK_0_X_R_DATA)
    );
    
logic [7:0] STACK_1_X_R_DATA;    
stack_8x8b STACK_1
    (
    .clk(clk),
    .rst_n(rst_n),
    .pop(FSM_0_X_S2_POP),
    .push(FSM_0_X_S1_POP),
    .w_data(STACK_0_X_R_DATA),
    .empty(STACK_1_X_EMPTY),
    .full(STACK_1_X_FULL),
    .r_data(STACK_1_X_R_DATA)
    );

mux2 MUX2_0 (
    .in1(STACK_1_X_R_DATA),
    .in0(0),
    .sel(FSM_0_X_S2_POP),
    .out0(r_data)
);

fsm FSM_0 (
    .clk(clk),
    .rst_n(rst_n),
    .s1_empty(STACK_0_X_EMPTY),
    .s1_full(STACK_0_X_FULL),
    .s2_empty(STACK_1_X_EMPTY),
    .s1_pop(FSM_0_X_S1_POP),
    .s2_pop(FSM_0_X_S2_POP)
);
endmodule
