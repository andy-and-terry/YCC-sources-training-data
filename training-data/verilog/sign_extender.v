module sign_extender #(
    parameter IN_WIDTH = 8,
    parameter OUT_WIDTH = 16
) (
    input wire [IN_WIDTH-1:0] in,
    input wire is_signed,
    output wire [OUT_WIDTH-1:0] out
);

wire fill = is_signed & in[IN_WIDTH-1];

assign out = {{(OUT_WIDTH-IN_WIDTH){fill}}, in};

endmodule
