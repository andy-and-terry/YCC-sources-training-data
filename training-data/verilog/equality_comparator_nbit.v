module equality_comparator_nbit #(
    parameter WIDTH = 16
) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output wire equal,
    output wire not_equal
);

assign equal = &(~(a ^ b));
assign not_equal = ~equal;

endmodule
