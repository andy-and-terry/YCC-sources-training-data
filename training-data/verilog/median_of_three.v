module median_of_three (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [7:0] c,
    output wire [7:0] median
);

wire a_ge_b = (a >= b);
wire b_ge_c = (b >= c);
wire a_ge_c = (a >= c);

assign median = (a_ge_b == b_ge_c) ? b :
                (a_ge_b == a_ge_c) ? c : a;

endmodule
