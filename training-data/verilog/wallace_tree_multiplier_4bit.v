module wallace_tree_multiplier_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [7:0] product
);

wire [3:0] pp0, pp1, pp2, pp3;

assign pp0 = a & {4{b[0]}};
assign pp1 = a & {4{b[1]}};
assign pp2 = a & {4{b[2]}};
assign pp3 = a & {4{b[3]}};

wire [4:0] row1_sum;
wire [4:0] row2_sum;

assign row1_sum = {1'b0, pp0} + {pp1, 1'b0};
assign row2_sum = {1'b0, pp2} + {pp3, 1'b0};

assign product = row1_sum + (row2_sum << 2);

endmodule
