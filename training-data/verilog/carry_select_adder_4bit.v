module carry_select_adder_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

wire [1:0] sum_lo;
wire cout_lo;
assign {cout_lo, sum_lo} = a[1:0] + b[1:0] + cin;

wire [1:0] sum_hi0, sum_hi1;
wire cout_hi0, cout_hi1;
assign {cout_hi0, sum_hi0} = a[3:2] + b[3:2] + 1'b0;
assign {cout_hi1, sum_hi1} = a[3:2] + b[3:2] + 1'b1;

wire [1:0] sum_hi;
assign sum_hi = cout_lo ? sum_hi1 : sum_hi0;
assign cout = cout_lo ? cout_hi1 : cout_hi0;

assign sum = {sum_hi, sum_lo};

endmodule
