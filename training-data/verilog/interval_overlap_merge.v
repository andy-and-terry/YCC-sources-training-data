// Two closed intervals [lo_a,hi_a] and [lo_b,hi_b]: do they overlap, and what is the union hull?
module interval_overlap_merge (
    input wire [7:0] lo_a, hi_a,
    input wire [7:0] lo_b, hi_b,
    output wire overlap,
    output wire [7:0] merged_lo,
    output wire [7:0] merged_hi
);

assign overlap   = (lo_a <= hi_b) && (lo_b <= hi_a);
assign merged_lo = (lo_a < lo_b) ? lo_a : lo_b;
assign merged_hi = (hi_a > hi_b) ? hi_a : hi_b;

endmodule
