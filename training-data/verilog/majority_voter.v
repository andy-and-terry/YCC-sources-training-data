// Triple-modular-redundancy majority vote
module majority_voter (
    input  wire a, b, c,
    output wire y
);
    assign y = (a & b) | (a & c) | (b & c);
endmodule
