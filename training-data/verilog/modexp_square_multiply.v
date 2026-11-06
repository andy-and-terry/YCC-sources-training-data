// Modular exponentiation by square-and-multiply: result = base^exp mod m
// (the core of a Fermat primality test with base 2)
module modexp_square_multiply (
    input  wire [15:0] base,
    input  wire [15:0] exp,
    input  wire [15:0] m,
    output reg  [15:0] result
);

reg [31:0] b, r;
integer i;

always @* begin
    b = base % m;
    r = 1;
    for (i = 0; i < 16; i = i + 1) begin
        if (exp[i])
            r = (r * b) % m;
        b = (b * b) % m;
    end
    result = r[15:0];
end

endmodule
