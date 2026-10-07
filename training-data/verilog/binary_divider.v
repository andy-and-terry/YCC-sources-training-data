module binary_divider #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] dividend,
    input wire [3:0] divisor,
    output reg [WIDTH-1:0] quotient,
    output reg [3:0] remainder,
    output wire div_by_zero
);

integer i;

assign div_by_zero = (divisor == 4'b0);

always @(*) begin
    quotient = 0;
    remainder = 0;
    if (!div_by_zero) begin
        for (i = WIDTH - 1; i >= 0; i = i - 1) begin
            remainder = {remainder[2:0], dividend[i]};
            if (remainder >= divisor) begin
                remainder = remainder - divisor;
                quotient[i] = 1'b1;
            end else begin
                quotient[i] = 1'b0;
            end
        end
    end
end

endmodule
