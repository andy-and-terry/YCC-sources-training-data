module popcount_tree (
    input  wire [7:0] x,
    output wire [3:0] count
);
    wire [1:0] p0 = x[0] + x[1];
    wire [1:0] p1 = x[2] + x[3];
    wire [1:0] p2 = x[4] + x[5];
    wire [1:0] p3 = x[6] + x[7];
    wire [2:0] q0 = p0 + p1;
    wire [2:0] q1 = p2 + p3;
    assign count = q0 + q1;
endmodule
