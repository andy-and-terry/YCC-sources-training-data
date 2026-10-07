module multiply_accumulate_unit #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire valid,
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output reg [2*WIDTH+3:0] accumulator
);

wire [2*WIDTH-1:0] product;

assign product = a * b;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        accumulator <= 0;
    end else if (clear) begin
        accumulator <= 0;
    end else if (valid) begin
        accumulator <= accumulator + product;
    end
end

endmodule
