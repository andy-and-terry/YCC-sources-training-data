module thermometer_encoder #(
    parameter N = 8
) (
    input wire [$clog2(N+1)-1:0] value,
    output wire [N-1:0] thermo
);

// thermo[i] is high when value > i
genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin : bit_gen
        assign thermo[i] = (value > i);
    end
endgenerate

endmodule
