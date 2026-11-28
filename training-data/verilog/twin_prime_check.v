// True when n and n+2 are both prime (n < 62)
module twin_prime_check (
    input  wire [5:0] n,
    output wire       twin
);
    wire p0, p2;
    is_prime_small u0 (.n(n),       .prime(p0));
    is_prime_small u1 (.n(n + 6'd2), .prime(p2));
    assign twin = p0 & p2;
endmodule
