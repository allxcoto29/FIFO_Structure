`timescale 1ns / 1ps


module or2(
    input logic in0,
    input logic in1,
    
    output logic out0
    );
    
assign out0 = (in0 | in1);
endmodule
