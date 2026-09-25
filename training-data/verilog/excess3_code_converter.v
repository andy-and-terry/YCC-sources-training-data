module binary_to_excess3 (
    input wire [3:0] bcd_in,
    output wire [3:0] excess3_out
);

assign excess3_out = bcd_in + 4'd3;

endmodule

module excess3_to_binary (
    input wire [3:0] excess3_in,
    output wire [3:0] bcd_out
);

assign bcd_out = excess3_in - 4'd3;

endmodule
