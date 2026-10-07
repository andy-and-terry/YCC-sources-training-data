module bit_reverser #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] in,
    output reg [WIDTH-1:0] out
);

integer i;

always @(*) begin
    for (i = 0; i < WIDTH; i = i + 1) begin
        out[i] = in[WIDTH-1-i];
    end
end

endmodule
