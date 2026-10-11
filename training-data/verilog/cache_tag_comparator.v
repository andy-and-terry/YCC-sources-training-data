module cache_tag_comparator #(
    parameter TAG_W = 20,
    parameter WAYS = 4
) (
    input wire [TAG_W-1:0] addr_tag,
    input wire [WAYS*TAG_W-1:0] stored_tags,
    input wire [WAYS-1:0] valid,
    output wire [WAYS-1:0] way_hit,
    output wire hit
);

genvar i;
generate
    for (i = 0; i < WAYS; i = i + 1) begin : cmp
        assign way_hit[i] = valid[i] & (stored_tags[i*TAG_W +: TAG_W] == addr_tag);
    end
endgenerate

assign hit = |way_hit;

endmodule
