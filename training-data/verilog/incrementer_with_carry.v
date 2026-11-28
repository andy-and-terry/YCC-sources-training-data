// 8-bit incrementer: a + 1, with carry-out set when a was all ones.
module incrementer_with_carry (
    input wire [7:0] a,
    output wire [7:0] sum,
    output wire cout
);

assign {cout, sum} = {1'b0, a} + 9'd1;

endmodule
