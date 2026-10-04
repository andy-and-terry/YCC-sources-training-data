module absolute_value (
    input  wire signed [7:0] value,
    output wire        [7:0] magnitude,
    output wire              overflow
);

assign magnitude = value[7] ? (~value + 8'd1) : value;
// -128 has no positive 8-bit counterpart
assign overflow = (value == -8'sd128);

endmodule
