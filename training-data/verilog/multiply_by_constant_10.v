module multiply_by_constant_10 (
    input wire [7:0] x,
    output wire [11:0] product
);

// 10x = 8x + 2x, implemented with shifts and a single adder
wire [11:0] x_ext = {4'b0000, x};
assign product = (x_ext << 3) + (x_ext << 1);

endmodule
