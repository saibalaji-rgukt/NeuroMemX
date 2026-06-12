module pattern_separator
(
input [7:0] current_data,
input [7:0] previous_data,
output duplicate_flag
);

assign duplicate_flag = (current_data == previous_data);

endmodule
