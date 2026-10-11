module demux_1to8 (
    input wire d,
    input wire [2:0] sel,
    output wire [7:0] y
);

assign y = {7'b0, d} << sel;

endmodule
