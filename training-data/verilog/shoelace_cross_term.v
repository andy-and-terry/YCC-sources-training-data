module shoelace_cross_term (
    input  wire signed [7:0]  x1, y1, x2, y2,
    output wire signed [16:0] cross
);

// One term of the shoelace sum: x1*y2 - x2*y1
assign cross = x1 * y2 - x2 * y1;

endmodule
