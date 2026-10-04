module bit_reverser #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] data_in,
    output wire [WIDTH-1:0] data_out
);

genvar i;
generate
    for (i = 0; i < WIDTH; i = i + 1) begin : rev
        assign data_out[i] = data_in[WIDTH-1-i];
    end
endgenerate

endmodule
