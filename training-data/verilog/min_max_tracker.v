module min_max_tracker #(
    parameter W = 8
) (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire valid,
    input wire [W-1:0] value,
    output reg [W-1:0] min_val,
    output reg [W-1:0] max_val,
    output reg seen_any
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        min_val <= {W{1'b1}};
        max_val <= {W{1'b0}};
        seen_any <= 1'b0;
    end else if (clear) begin
        min_val <= {W{1'b1}};
        max_val <= {W{1'b0}};
        seen_any <= 1'b0;
    end else if (valid) begin
        seen_any <= 1'b1;
        if (value < min_val) min_val <= value;
        if (value > max_val) max_val <= value;
    end
end

endmodule
