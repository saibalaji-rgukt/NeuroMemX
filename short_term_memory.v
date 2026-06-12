module short_term_memory
#(
parameter DSIZE = 8,
parameter DEPTH = 8
)
(
input clk,
input rst,
input write_en,
input [DSIZE-1:0] data_in,
input [2:0] addr,
output reg [DSIZE-1:0] data_out
);

reg [DSIZE-1:0] stm_mem [0:DEPTH-1];

integer i;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        for(i=0;i<DEPTH;i=i+1)
            stm_mem[i] <= 0;
    end
    else if(write_en)
        stm_mem[addr] <= data_in;
end

always @(*)
begin
    data_out = stm_mem[addr];
end

endmodule
