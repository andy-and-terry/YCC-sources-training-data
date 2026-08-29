module generate_block_adder_array #(
    parameter N = 4
) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] sum,
    output wire cout
);

wire [N:0] carry;
assign carry[0] = cin;
assign cout = carry[N];

genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin : adder_stage
        assign sum[i] = a[i] ^ b[i] ^ carry[i];
        assign carry[i + 1] = (a[i] & b[i]) | (carry[i] & (a[i] ^ b[i]));
    end
endgenerate

endmodule
