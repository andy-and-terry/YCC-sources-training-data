module thermometer_encoder (
    input  wire [2:0] binary,
    output wire [6:0] thermometer
);

genvar i;
generate
    for (i = 0; i < 7; i = i + 1) begin : bits
        assign thermometer[i] = (binary > i);
    end
endgenerate

endmodule
