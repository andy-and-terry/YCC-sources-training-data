module bcd_to_binary_converter (
    input wire [3:0] bcd_hundreds,
    input wire [3:0] bcd_tens,
    input wire [3:0] bcd_ones,
    output wire [9:0] binary_out
);

assign binary_out = bcd_hundreds * 8'd100 + bcd_tens * 8'd10 + bcd_ones;

endmodule
