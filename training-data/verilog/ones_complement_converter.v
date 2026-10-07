module ones_complement_converter #(
    parameter WIDTH = 8
) (
    input  wire [WIDTH-1:0] value,
    output wire [WIDTH-1:0] ones_complement
);

assign ones_complement = ~value;

endmodule
