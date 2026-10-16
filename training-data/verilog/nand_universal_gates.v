module nand_universal_gates (
    input wire a,
    input wire b,
    output wire not_a,
    output wire and_ab,
    output wire or_ab,
    output wire xor_ab
);

wire n_ab;
nand (n_ab, a, b);
nand (not_a, a, a);
nand (and_ab, n_ab, n_ab);

wire n_b;
nand (n_b, b, b);
nand (or_ab, not_a, n_b);

wire t1, t2;
nand (t1, a, n_ab);
nand (t2, b, n_ab);
nand (xor_ab, t1, t2);

endmodule
