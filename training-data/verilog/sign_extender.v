module sign_extender #(
    parameter IN_W = 8,
    parameter OUT_W = 16
) (
    input wire [IN_W-1:0] in,
    output wire [OUT_W-1:0] out
);

// Replicate the sign bit into the upper bits
assign out = {{(OUT_W-IN_W){in[IN_W-1]}}, in};

endmodule
