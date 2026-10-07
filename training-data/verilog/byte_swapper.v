// Converts a 32-bit word between big-endian and little-endian byte order.
module byte_swapper (
    input wire [31:0] data_in,
    input wire swap_en,
    output wire [31:0] data_out
);

wire [31:0] swapped = {data_in[7:0], data_in[15:8], data_in[23:16], data_in[31:24]};

assign data_out = swap_en ? swapped : data_in;

endmodule
