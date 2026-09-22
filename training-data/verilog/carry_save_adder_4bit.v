module carry_save_adder_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [3:0] c,
    output wire [3:0] sum,
    output wire [3:0] carry
);

assign sum = a ^ b ^ c;
assign carry = (a & b) | (b & c) | (a & c);

endmodule
