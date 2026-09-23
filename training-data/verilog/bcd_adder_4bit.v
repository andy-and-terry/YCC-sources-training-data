module bcd_adder_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

wire [4:0] binary_sum;
wire correction_needed;
wire [4:0] corrected_sum;

assign binary_sum = a + b + cin;
assign correction_needed = (binary_sum > 5'd9);
assign corrected_sum = correction_needed ? (binary_sum + 5'd6) : binary_sum;

assign sum = corrected_sum[3:0];
assign cout = correction_needed;

endmodule
