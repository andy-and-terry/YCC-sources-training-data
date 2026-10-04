module absolute_value #(
    parameter WIDTH = 8
) (
    input wire signed [WIDTH-1:0] value_in,
    output wire [WIDTH-1:0] magnitude,
    output wire is_negative,
    output wire overflow
);

assign is_negative = value_in[WIDTH-1];
assign magnitude = is_negative ? (~value_in + 1'b1) : value_in;
// the most negative value has no positive counterpart in two's complement
assign overflow = is_negative && (value_in == {1'b1, {(WIDTH-1){1'b0}}});

endmodule
