module wallace_tree_multiplier_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [7:0] product
);

wire [3:0] pp0, pp1, pp2, pp3;
assign pp0 = a & {4{b[0]}};
assign pp1 = a & {4{b[1]}};
assign pp2 = a & {4{b[2]}};
assign pp3 = a & {4{b[3]}};

wire [7:0] r0, r1, r2, r3;
assign r0 = {4'b0, pp0};
assign r1 = {3'b0, pp1, 1'b0};
assign r2 = {2'b0, pp2, 2'b0};
assign r3 = {1'b0, pp3, 3'b0};

// Level 1: a 3:2 carry-save reduction of r0/r1/r2 into a sum row and a
// carry row (the carry row is shifted left one column, as usual).
wire [7:0] sum1, carry1raw, carry1;
assign sum1      = r0 ^ r1 ^ r2;
assign carry1raw = (r0 & r1) | (r1 & r2) | (r0 & r2);
assign carry1    = carry1raw << 1;

// Level 2: reduce sum1, carry1, and the leftover row r3 the same way.
wire [7:0] sum2, carry2raw, carry2;
assign sum2      = sum1 ^ carry1 ^ r3;
assign carry2raw = (sum1 & carry1) | (carry1 & r3) | (sum1 & r3);
assign carry2    = carry2raw << 1;

// Final carry-propagate add combines the last sum/carry pair.
assign product = sum2 + carry2;

endmodule
