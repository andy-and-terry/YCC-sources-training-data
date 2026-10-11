module rotate_left_variable (
    input wire [7:0] in,
    input wire [2:0] amount,
    output wire [7:0] out
);

wire [15:0] doubled = {in, in};
assign out = doubled[15 - amount -: 8];

endmodule
