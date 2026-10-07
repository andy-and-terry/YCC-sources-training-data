module lfsr_galois #(
    parameter WIDTH = 8,
    parameter TAPS  = 8'hB4
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             enable,
    output reg  [WIDTH-1:0] lfsr_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        lfsr_out <= {{(WIDTH-1){1'b0}}, 1'b1};
    end else if (enable) begin
        if (lfsr_out[0]) begin
            lfsr_out <= (lfsr_out >> 1) ^ TAPS;
        end else begin
            lfsr_out <= lfsr_out >> 1;
        end
    end
end

endmodule
