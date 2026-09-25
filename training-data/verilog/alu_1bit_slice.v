module alu_1bit_slice (
    input wire a,
    input wire b,
    input wire cin,
    input wire [1:0] op,   // 00: add, 01: subtract, 10: and, 11: or
    output wire result,
    output wire cout
);

wire b_mod;
wire sum;

assign b_mod = b ^ op[0];
assign sum = a ^ b_mod ^ cin;
assign cout = (a & b_mod) | (a & cin) | (b_mod & cin);

assign result = op[1] ? (op[0] ? (a | b) : (a & b)) : sum;

endmodule
