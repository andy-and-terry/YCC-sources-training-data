module binary_to_onehot_decoder_parameterized #(
    parameter INWIDTH  = 3,
    parameter OUTWIDTH = (1 << INWIDTH)
) (
    input  wire [INWIDTH-1:0]  binary_in,
    input  wire                enable,
    output reg  [OUTWIDTH-1:0] onehot_out
);

always @(*) begin
    onehot_out = {OUTWIDTH{1'b0}};
    if (enable) begin
        onehot_out[binary_in] = 1'b1;
    end
end

endmodule
