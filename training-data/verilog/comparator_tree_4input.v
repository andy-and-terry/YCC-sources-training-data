module comparator_tree_4input (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [7:0] c,
    input wire [7:0] d,
    output wire [7:0] max_val
);

wire [7:0] max_ab, max_cd;

assign max_ab = (a > b) ? a : b;
assign max_cd = (c > d) ? c : d;
assign max_val = (max_ab > max_cd) ? max_ab : max_cd;

endmodule
