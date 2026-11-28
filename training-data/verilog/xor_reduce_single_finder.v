// When every value occurs twice except one, XOR-ing all bytes leaves the odd one out.
module xor_reduce_single_finder (
    input wire [7:0] a, b, c, d, e,
    output wire [7:0] single
);

assign single = a ^ b ^ c ^ d ^ e;

endmodule
