// Count adjacent pairs in a stream of 4 values whose sum equals K
// (the length-2 case of "subarray sum equals k")
module pair_sum_counter #(
    parameter K = 2
) (
    input  wire [7:0] a0, a1, a2, a3,
    output wire [2:0] count
);

wire p0 = (a0 + a1) == K;
wire p1 = (a1 + a2) == K;
wire p2 = (a2 + a3) == K;

assign count = p0 + p1 + p2;

endmodule
