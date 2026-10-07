module twos_complement_converter #(
    parameter WIDTH = 4
) (
    input wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out,
    output wire overflow
);

assign out = (~in) + 1'b1;

// the most negative value (1000...0) has no positive two's complement
// representation in the same width, so negating it overflows
assign overflow = (in == {1'b1, {(WIDTH-1){1'b0}}});

endmodule
