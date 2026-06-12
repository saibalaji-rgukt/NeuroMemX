module retrieval_unit
(
input [7:0] stm_data,
input [7:0] ltm_data,
input select_memory,

output [7:0] data_out
);

assign data_out = (select_memory) ? ltm_data : stm_data;

endmodule
