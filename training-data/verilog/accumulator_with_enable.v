module accumulator_with_enable #(
    parameter IN_WIDTH = 8,
    parameter ACC_WIDTH = 16
) (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire enable,
    input wire [IN_WIDTH-1:0] data_in,
    output reg [ACC_WIDTH-1:0] sum,
    output reg overflow
);

wire [ACC_WIDTH:0] next_sum;

assign next_sum = {1'b0, sum} + {{(ACC_WIDTH-IN_WIDTH+1){1'b0}}, data_in};

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sum <= {ACC_WIDTH{1'b0}};
        overflow <= 1'b0;
    end else if (clear) begin
        sum <= {ACC_WIDTH{1'b0}};
        overflow <= 1'b0;
    end else if (enable) begin
        sum <= next_sum[ACC_WIDTH-1:0];
        if (next_sum[ACC_WIDTH])
            overflow <= 1'b1;
    end
end

endmodule
