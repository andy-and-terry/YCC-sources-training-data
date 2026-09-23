module overflow_detector_4bit (
    input wire signed [3:0] a,
    input wire signed [3:0] b,
    output wire signed [3:0] sum,
    output wire overflow
);

assign sum = a + b;
// Signed overflow can only happen when both operands share a sign and the
// result's sign differs from theirs.
assign overflow = (a[3] == b[3]) && (sum[3] != a[3]);

endmodule
