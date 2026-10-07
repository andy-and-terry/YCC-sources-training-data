module min_max_tracker #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire valid,
    input wire [WIDTH-1:0] sample,
    output reg [WIDTH-1:0] min_value,
    output reg [WIDTH-1:0] max_value,
    output reg seen_any
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        min_value <= {WIDTH{1'b1}};
        max_value <= {WIDTH{1'b0}};
        seen_any <= 1'b0;
    end else if (clear) begin
        min_value <= {WIDTH{1'b1}};
        max_value <= {WIDTH{1'b0}};
        seen_any <= 1'b0;
    end else if (valid) begin
        seen_any <= 1'b1;
        if (sample < min_value)
            min_value <= sample;
        if (sample > max_value)
            max_value <= sample;
    end
end

endmodule
