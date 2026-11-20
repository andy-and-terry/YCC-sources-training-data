// Primality checker for 4-bit numbers by lookup.
module small_prime_check (
    input  wire [3:0] n,
    output wire       is_prime
);
    assign is_prime = (n == 2) | (n == 3) | (n == 5) | (n == 7) | (n == 11) | (n == 13);
endmodule
