module ripple_adder #(parameter N = 4) (
    input  wire [N-1:0] a, b,
    input  wire cin,
    output wire [N-1:0] sum,
    output wire cout
);
    wire [N:0] c;
    assign c[0] = cin;
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : fa
            assign sum[i] = a[i] ^ b[i] ^ c[i];
            assign c[i+1] = (a[i] & b[i]) | (c[i] & (a[i] ^ b[i]));
        end
    endgenerate
    assign cout = c[N];
endmodule
