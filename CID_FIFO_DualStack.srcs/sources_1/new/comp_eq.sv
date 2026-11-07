`timescale 1ns / 1ps

module comp_eq
    (
    input logic [3:0] in0,
    input logic [3:0] in1,
    
    output logic      out0
    );

assign out0 = (in0 == in1);
endmodule
