// Manhattan distance of two 2-D points (unsigned coordinates).
module manhattan_distance #(parameter W = 8) (
    input  wire [W-1:0] x1, y1, x2, y2,
    output wire [W:0]   dist
);
    wire [W-1:0] dx = (x1 >= x2) ? x1 - x2 : x2 - x1;
    wire [W-1:0] dy = (y1 >= y2) ? y1 - y2 : y2 - y1;
    assign dist = dx + dy;
endmodule
