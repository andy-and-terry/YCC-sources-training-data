module majority_voter_3input (
    input wire a,
    input wire b,
    input wire c,
    output wire majority,
    output wire disagree
);

assign majority = (a & b) | (b & c) | (a & c);
assign disagree = a ^ b ^ c ^ majority;

endmodule
