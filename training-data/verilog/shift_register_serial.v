module shift8 (
    input clk, input din, output reg [7:0] q
);
    always @(posedge clk) q <= {q[6:0], din};
endmodule
