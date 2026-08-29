module barrel_shifter (
    input wire [7:0] data_in,
    input wire [2:0] shift_amount,
    input wire direction,
    output wire [7:0] data_out
);

assign data_out = direction ? (data_in << shift_amount) : (data_in >> shift_amount);

endmodule
