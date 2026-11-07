`timescale 1ns / 1ps

module stack_8x8b
    (
    input logic        clk,
    input logic        rst_n,
    input logic        pop,
    input logic        push,
    input logic  [7:0] w_data,
    
    output logic       empty,
    output logic       full,
    output logic [7:0] r_data
    );
  
logic OR_0_X_OUT;
logic [3:0] COUNTER_0_X_OUT;
logic [2:0] SUB_0_X_OUT;

logic COMP_EQ_1_X_OUT;
logic COMP_EQ_0_X_OUT;
  
or2 OR_0 (
    .in0(pop),
    .in1(push),
    .out0(OR_0_X_OUT)
);

counter COUNTER_0
    (
    .clk(clk),
    .en(OR_0_X_OUT),
    .rst_n(rst_n),
    .up(push),
    .out(COUNTER_0_X_OUT) 
    );

comp_eq COMP_EQ_0
    (
    .in0(COUNTER_0_X_OUT),
    .in1(0),
    .out0(COMP_EQ_0_X_OUT)
    );

comp_eq COMP_EQ_1
    (
    .in0(COUNTER_0_X_OUT),
    .in1(8),
    .out0(COMP_EQ_1_X_OUT)
    );

sub SUB_0
    (
    .in0(COUNTER_0_X_OUT[2:0]),
    .in1(1),
    .out0(SUB_0_X_OUT)
    );

ram_8x8b RAM_0
    (
    .clk(clk),
    .w_en(push),    
    .r_addr(SUB_0_X_OUT),
    .w_addr(COUNTER_0_X_OUT[2:0]),
    .w_data(w_data),
    .r_data(r_data)
    );

assign full = COMP_EQ_1_X_OUT;
assign empty = COMP_EQ_0_X_OUT;
endmodule
