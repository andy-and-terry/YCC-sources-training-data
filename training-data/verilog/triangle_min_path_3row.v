// Minimum top-to-bottom path cost through a 3-row triangle (rows: 1, 2, 3 values).
module triangle_min_path_3row (
    input wire [7:0] r0,
    input wire [7:0] r1a, r1b,
    input wire [7:0] r2a, r2b, r2c,
    output wire [9:0] best
);

wire [8:0] left_cost  = r1a + ((r2a < r2b) ? r2a : r2b);
wire [8:0] right_cost = r1b + ((r2b < r2c) ? r2b : r2c);

assign best = r0 + ((left_cost < right_cost) ? left_cost : right_cost);

endmodule
