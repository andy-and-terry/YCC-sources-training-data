// Chebyshev distance of two 2-D points with 4-bit unsigned coordinates
module chebyshev_distance (
    input  wire [3:0] x1, y1, x2, y2,
    output wire [3:0] dist
);
    wire [3:0] dx = (x1 > x2) ? (x1 - x2) : (x2 - x1);
    wire [3:0] dy = (y1 > y2) ? (y1 - y2) : (y2 - y1);
    assign dist = (dx > dy) ? dx : dy;
endmodule
