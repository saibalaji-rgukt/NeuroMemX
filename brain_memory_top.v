module brain_memory_top
(
input clk,
input rst,
input write_en,
input [7:0] data_in,

input [2:0] stm_addr,
input [4:0] ltm_addr,

input select_memory,

output [7:0] data_out,
output important_flag
);

wire [7:0] stm_data;
wire [7:0] ltm_data;
wire ltm_write_en;

short_term_memory STM(
.clk(clk),
.rst(rst),
.write_en(write_en),
.data_in(data_in),
.addr(stm_addr),
.data_out(stm_data)
);

importance_analyzer IA(
.clk(clk),
.rst(rst),
.data_in(data_in),
.important_flag(important_flag)
);

memory_transfer_unit MTU(
.important_flag(important_flag),
.ltm_write_en(ltm_write_en)
);

long_term_memory LTM(
.clk(clk),
.rst(rst),
.write_en(ltm_write_en),
.data_in(data_in),
.addr(ltm_addr),
.data_out(ltm_data)
);

retrieval_unit RU(
.stm_data(stm_data),
.ltm_data(ltm_data),
.select_memory(select_memory),
.data_out(data_out)
);

endmodule
