module secant_step (
    input  wire signed [31:0] x0, x1, f0, f1,   // Q16.16 fixed point
    output wire signed [31:0] x2
);

wire signed [63:0] num = $signed(f1) * $signed(x1 - x0);
wire signed [63:0] q   = (f1 == f0) ? 64'sd0 : (num <<< 16) / $signed({{32{(f1 - f0) >>> 31}}, f1 - f0});

assign x2 = x1 - q[47:16];

endmodule
