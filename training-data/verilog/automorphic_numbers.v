module automorphic_numbers (
    input  wire [9:0]  n,           // 0..999
    output wire        is_automorphic
);

wire [19:0] square = n * n;
wire [9:0]  modulus = (n < 10) ? 10 : (n < 100) ? 100 : 1000;

assign is_automorphic = ((square % modulus) == n);

endmodule
