module pipelined_multiplier #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output reg [2*WIDTH-1:0] product
);

reg [WIDTH-1:0] a_reg, b_reg;
reg [2*WIDTH-1:0] product_stage;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        a_reg <= 0;
        b_reg <= 0;
        product_stage <= 0;
        product <= 0;
    end else begin
        a_reg <= a;
        b_reg <= b;
        product_stage <= a_reg * b_reg;
        product <= product_stage;
    end
end

endmodule
