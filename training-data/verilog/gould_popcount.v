module gould_popcount (
    input  wire [3:0] n,
    output wire [4:0] gould
);

wire [2:0] ones = n[0] + n[1] + n[2] + n[3];
assign gould = 5'd1 << ones;

endmodule
