module sign_extender #(
    parameter IN_WIDTH = 8,
    parameter OUT_WIDTH = 16
) (
    input wire [IN_WIDTH-1:0] data_in,
    input wire is_signed,
    output wire [OUT_WIDTH-1:0] data_out
);

wire fill;

assign fill = is_signed & data_in[IN_WIDTH-1];
assign data_out = {{(OUT_WIDTH-IN_WIDTH){fill}}, data_in};

endmodule
