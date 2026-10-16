module absolute_difference #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output wire [WIDTH-1:0] diff
);

assign diff = (a >= b) ? (a - b) : (b - a);

endmodule
