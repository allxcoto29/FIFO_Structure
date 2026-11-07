`timescale 1ns / 1ps


module debounce
    (
    input  clock,
    input  in,
    output out
    );
parameter limit = 20'd2;
reg [19:0] counter;
reg hit;
assign out = (counter == limit);
always@(posedge clock) begin
    if(!in) begin
        counter <= 0;
        hit <= 0;
    end else if(counter == limit) begin
        hit <= 1;
        counter <= counter + 1;
    end else if(in & !hit) begin
        counter <= counter + 1;
    end
end
endmodule
