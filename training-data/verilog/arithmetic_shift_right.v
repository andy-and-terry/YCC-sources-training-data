module arithmetic_shift_right (
    input wire signed [15:0] in,
    input wire [3:0] amount,
    output wire signed [15:0] out
);

assign out = in >>> amount;

endmodule
