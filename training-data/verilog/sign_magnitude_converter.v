module sign_magnitude_to_twos_complement #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] sign_mag_in,
    output wire [WIDTH-1:0] twos_comp_out
);

wire [WIDTH-1:0] magnitude = {1'b0, sign_mag_in[WIDTH-2:0]};

assign twos_comp_out = sign_mag_in[WIDTH-1] ? (~magnitude + 1'b1) : sign_mag_in;

endmodule

module twos_complement_to_sign_magnitude #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] twos_comp_in,
    output wire [WIDTH-1:0] sign_mag_out
);

wire sign = twos_comp_in[WIDTH-1];
wire [WIDTH-1:0] mag_calc = sign ? (~twos_comp_in + 1'b1) : twos_comp_in;

assign sign_mag_out = {sign, mag_calc[WIDTH-2:0]};

endmodule
