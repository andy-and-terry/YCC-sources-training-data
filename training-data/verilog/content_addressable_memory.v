// Content-addressable memory (associative lookup): search_data is compared
// against every stored entry in parallel each cycle, returning the address
// of the first match, rather than looking a value up by address like the
// RAM/register-file/FIFO models elsewhere in this folder.
module content_addressable_memory #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
) (
    input wire clk,
    input wire wr_en,
    input wire [$clog2(DEPTH)-1:0] wr_addr,
    input wire [WIDTH-1:0] wr_data,
    input wire [WIDTH-1:0] search_data,
    output reg [$clog2(DEPTH)-1:0] match_addr,
    output reg match_found
);

reg [WIDTH-1:0] entries [0:DEPTH-1];
integer i;

always @(posedge clk) begin
    if (wr_en) begin
        entries[wr_addr] <= wr_data;
    end
end

always @(*) begin
    match_found = 1'b0;
    match_addr = {$clog2(DEPTH){1'b0}};
    for (i = 0; i < DEPTH; i = i + 1) begin
        if (!match_found && entries[i] == search_data) begin
            match_found = 1'b1;
            match_addr = i[$clog2(DEPTH)-1:0];
        end
    end
end

endmodule
