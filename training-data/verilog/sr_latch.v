module sr_latch (
    input wire s,
    input wire r,
    output reg q,
    output wire qn
);

always @(s or r) begin
    if (s && !r) q = 1'b1;
    else if (!s && r) q = 1'b0;
end

assign qn = ~q;

endmodule
