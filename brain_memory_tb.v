`timescale 1ns/1ps

module brain_memory_tb;

reg clk;
reg rst;
reg write_en;
reg [7:0] data_in;

reg [2:0] stm_addr;
reg [4:0] ltm_addr;

reg select_memory;

wire [7:0] data_out;
wire important_flag;

brain_memory_top DUT(
.clk(clk),
.rst(rst),
.write_en(write_en),
.data_in(data_in),
.stm_addr(stm_addr),
.ltm_addr(ltm_addr),
.select_memory(select_memory),
.data_out(data_out),
.important_flag(important_flag)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    write_en = 0;
    data_in = 0;
    stm_addr = 0;
    ltm_addr = 0;
    select_memory = 0;

    #20 rst = 0;

    write_en = 1;

    data_in = 8'h14;
    stm_addr = 0;
    #10;

    data_in = 8'h14;
    stm_addr = 1;
    #10;

    data_in = 8'h14;
    stm_addr = 2;
    #10;

    data_in = 8'h28;
    stm_addr = 3;
    #10;

    select_memory = 1;
    ltm_addr = 0;

    #50;

    $finish;
end

endmodule
