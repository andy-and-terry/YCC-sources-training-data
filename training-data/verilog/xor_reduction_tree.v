module xor_reduction_tree (
    input wire [7:0] in,
    output wire out
);

wire [3:0] l1 = in[7:4] ^ in[3:0];
wire [1:0] l2 = l1[3:2] ^ l1[1:0];

assign out = l2[1] ^ l2[0];

endmodule
