// Intersection and union sizes of two 8-element bitmask sets
module jaccard_counts (
    input  wire [7:0] a, b,
    output reg  [3:0] inter, uni
);
    integer i;
    always @* begin
        inter = 0;
        uni = 0;
        for (i = 0; i < 8; i = i + 1) begin
            inter = inter + (a[i] & b[i]);
            uni   = uni + (a[i] | b[i]);
        end
    end
endmodule
