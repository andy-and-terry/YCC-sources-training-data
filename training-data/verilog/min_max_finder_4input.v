module min_max_finder_4input #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    input wire [WIDTH-1:0] c,
    input wire [WIDTH-1:0] d,
    output wire [WIDTH-1:0] min_val,
    output wire [WIDTH-1:0] max_val
);

wire [WIDTH-1:0] min_ab = (a < b) ? a : b;
wire [WIDTH-1:0] min_cd = (c < d) ? c : d;
wire [WIDTH-1:0] max_ab = (a > b) ? a : b;
wire [WIDTH-1:0] max_cd = (c > d) ? c : d;

assign min_val = (min_ab < min_cd) ? min_ab : min_cd;
assign max_val = (max_ab > max_cd) ? max_ab : max_cd;

endmodule
