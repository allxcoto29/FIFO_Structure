`timescale 1ns / 1ps

module tb();

logic clk_tb;
logic rst_n_tb;
logic save_data_tb;

logic [7:0] w_data_tb;
logic [7:0] r_data_tb;

queue dut(
    .clk(clk_tb),
    .rst_n(rst_n_tb),
    .save_data(save_data_tb),
    .w_data(w_data_tb),
    .r_data(r_data_tb)
);

initial begin
    clk_tb = 0;
    forever
       #2
       clk_tb = ~clk_tb;
end

initial begin
    rst_n_tb     = 0;
    save_data_tb = 0;
    w_data_tb    = 0;
    #5 rst_n_tb  = 1;
end

initial begin
    @(posedge rst_n_tb);
    for (int i = 1; i <= 8; i++) begin
        @(negedge clk_tb); save_data_tb = 1; w_data_tb = i;
        @(negedge clk_tb); save_data_tb = 0;
    end
end

initial #300 $stop();   // 100 ns isn't enough for load + move + output

endmodule
