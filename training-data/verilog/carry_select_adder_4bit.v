module full_adder_cell (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);
assign sum = a ^ b ^ cin;
assign cout = (a & b) | (cin & (a ^ b));
endmodule

module ripple_adder_2bit (
    input wire [1:0] a,
    input wire [1:0] b,
    input wire cin,
    output wire [1:0] sum,
    output wire cout
);

wire c0;

full_adder_cell fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c0));
full_adder_cell fa1 (.a(a[1]), .b(b[1]), .cin(c0), .sum(sum[1]), .cout(cout));

endmodule

// Splits the 4-bit add into two 2-bit groups. The low group's carry-out
// selects between two precomputed high-group results (cin=0 and cin=1),
// trading duplicated high-group hardware for shorter carry-propagation delay.
module carry_select_adder_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

wire c_low;
wire [1:0] sum_low;
wire [1:0] sum_high0, sum_high1;
wire cout_high0, cout_high1;

ripple_adder_2bit low_stage   (.a(a[1:0]), .b(b[1:0]), .cin(cin),  .sum(sum_low),   .cout(c_low));
ripple_adder_2bit high_stage0 (.a(a[3:2]), .b(b[3:2]), .cin(1'b0), .sum(sum_high0), .cout(cout_high0));
ripple_adder_2bit high_stage1 (.a(a[3:2]), .b(b[3:2]), .cin(1'b1), .sum(sum_high1), .cout(cout_high1));

assign sum[1:0] = sum_low;
assign sum[3:2] = c_low ? sum_high1 : sum_high0;
assign cout = c_low ? cout_high1 : cout_high0;

endmodule
