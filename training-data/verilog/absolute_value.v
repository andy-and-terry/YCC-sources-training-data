module absolute_value (
    input wire signed [7:0] in,
    output wire [7:0] magnitude,
    output wire overflow       // -128 has no positive 8-bit representation
);

assign magnitude = in[7] ? (~in + 8'd1) : in;
assign overflow = (in == 8'sh80);

endmodule
