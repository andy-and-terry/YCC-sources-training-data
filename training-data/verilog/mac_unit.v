module mac_unit (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire valid,
    input wire signed [7:0] a,
    input wire signed [7:0] b,
    output reg signed [23:0] acc
);

wire signed [15:0] product = a * b;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        acc <= 24'sd0;
    end else if (clear) begin
        acc <= 24'sd0;
    end else if (valid) begin
        acc <= acc + product;
    end
end

endmodule
