module bcd_adder (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

wire [4:0] binary_sum;
wire [4:0] corrected_sum;

assign binary_sum = a + b + cin;
assign corrected_sum = (binary_sum > 5'd9) ? (binary_sum + 5'd6) : binary_sum;
assign sum = corrected_sum[3:0];
assign cout = (binary_sum > 5'd9) ? 1'b1 : 1'b0;

endmodule
