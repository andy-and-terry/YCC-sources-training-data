module walking_ones_pattern_generator #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             enable,
    output reg  [WIDTH-1:0] pattern_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pattern_out <= {{(WIDTH-1){1'b0}}, 1'b1};
    end else if (enable) begin
        if (pattern_out == (1'b1 << (WIDTH - 1))) begin
            pattern_out <= {{(WIDTH-1){1'b0}}, 1'b1};
        end else begin
            pattern_out <= pattern_out << 1;
        end
    end
end

endmodule
