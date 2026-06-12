module memory_transfer_unit
(
input important_flag,
output ltm_write_en
);

assign ltm_write_en = important_flag;

endmodule
