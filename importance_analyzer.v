module importance_analyzer
(
input clk,
input rst,
input [7:0] data_in,
output reg important_flag
);

reg [7:0] prev_data;
reg [1:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        prev_data <= 0;
        count <= 0;
        important_flag <= 0;
    end
    else
    begin
        if(data_in == prev_data)
            count <= count + 1;
        else
            count <= 1;

        prev_data <= data_in;

        if(count >= 2)
            important_flag <= 1;
        else
            important_flag <= 0;
    end
end

endmodule
