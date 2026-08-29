module subtractor_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [3:0] diff,
    output wire borrow
);

wire [3:0] b_complement;
wire carry_out;

assign b_complement = ~b;
assign {carry_out, diff} = a + b_complement + 1'b1;
assign borrow = ~carry_out;

endmodule
