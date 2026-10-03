module priority_encoder_parameterized #(
    parameter WIDTH    = 8,
    parameter OUTWIDTH = $clog2(WIDTH)
) (
    input  wire [WIDTH-1:0]    request,
    output reg  [OUTWIDTH-1:0] encoded,
    output reg                 valid
);

integer i;

always @(*) begin
    encoded = {OUTWIDTH{1'b0}};
    valid   = 1'b0;
    for (i = WIDTH - 1; i >= 0; i = i - 1) begin
        if (request[i]) begin
            encoded = i[OUTWIDTH-1:0];
            valid   = 1'b1;
        end
    end
end

endmodule
