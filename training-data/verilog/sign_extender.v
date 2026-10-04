module sign_extender #(
    parameter IN_W  = 8,
    parameter OUT_W = 16
) (
    input  wire [IN_W-1:0]  in,
    input  wire             is_signed,
    output wire [OUT_W-1:0] out
);

wire fill = is_signed & in[IN_W-1];

assign out = {{(OUT_W-IN_W){fill}}, in};

endmodule
