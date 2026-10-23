module signed_arithmetic_compare (
    input  wire [7:0] a,
    input  wire [7:0] b,
    output wire       unsigned_lt,
    output wire       signed_lt,
    output wire [8:0] signed_sum,
    output wire [7:0] arith_shift
);

// Same bits, different interpretation: 8'hF0 is 240 unsigned but -16 signed
assign unsigned_lt = (a < b);
assign signed_lt   = ($signed(a) < $signed(b));

// Sign-extend both operands to 9 bits before adding
assign signed_sum = {a[7], a} + {b[7], b};

// Arithmetic shift right keeps the sign bit
assign arith_shift = $signed(a) >>> 2;

endmodule
