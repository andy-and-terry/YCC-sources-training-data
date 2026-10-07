module tristate_bus_multiplexer (
    input wire [3:0] data_a,
    input wire [3:0] data_b,
    input wire [3:0] data_c,
    input wire [3:0] data_d,
    input wire [1:0] sel,
    output wire [3:0] bus
);

assign bus = (sel == 2'b00) ? data_a : 4'bz;
assign bus = (sel == 2'b01) ? data_b : 4'bz;
assign bus = (sel == 2'b10) ? data_c : 4'bz;
assign bus = (sel == 2'b11) ? data_d : 4'bz;

endmodule
