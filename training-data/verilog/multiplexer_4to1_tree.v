module mux2to1_prim (
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);

assign out = sel ? b : a;

endmodule

module multiplexer_4to1_tree (
    input wire [3:0] data_in,
    input wire [1:0] sel,
    output wire data_out
);

wire low_out, high_out;

mux2to1_prim mux_low  (.a(data_in[0]), .b(data_in[1]), .sel(sel[0]), .out(low_out));
mux2to1_prim mux_high (.a(data_in[2]), .b(data_in[3]), .sel(sel[0]), .out(high_out));
mux2to1_prim mux_final(.a(low_out),    .b(high_out),   .sel(sel[1]), .out(data_out));

endmodule
