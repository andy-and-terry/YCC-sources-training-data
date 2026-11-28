// Primality test for values 0..63 by trial division, usable for twin-prime checks
module is_prime_small (
    input  wire [5:0] n,
    output reg        prime
);
    integer d;
    always @* begin
        prime = (n >= 2);
        for (d = 2; d < 8; d = d + 1)
            if (d < n && (n % d) == 0) prime = 1'b0;
    end
endmodule
