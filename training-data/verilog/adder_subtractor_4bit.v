module adder_subtractor_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire sub,
    output wire [3:0] result,
    output wire cout,
    output wire overflow
);

wire [3:0] b_xor;
wire [4:0] sum;

assign b_xor = b ^ {4{sub}};
assign sum = a + b_xor + sub;
assign result = sum[3:0];
assign cout = sum[4];
assign overflow = (a[3] == b_xor[3]) && (result[3] != a[3]);

endmodule
