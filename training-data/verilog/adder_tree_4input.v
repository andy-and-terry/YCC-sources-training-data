module adder_tree_4input #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    input wire [WIDTH-1:0] c,
    input wire [WIDTH-1:0] d,
    output wire [WIDTH+1:0] sum
);

wire [WIDTH:0] sum_ab, sum_cd;

assign sum_ab = a + b;
assign sum_cd = c + d;
assign sum = sum_ab + sum_cd;

endmodule
