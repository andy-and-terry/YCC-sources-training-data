module cuban_prime_gen (
    input  wire [7:0]  y,
    output wire [17:0] p
);

// Candidate cuban number 3y^2 + 3y + 1 (primality is checked elsewhere)
assign p = 3 * y * y + 3 * y + 1;

endmodule
