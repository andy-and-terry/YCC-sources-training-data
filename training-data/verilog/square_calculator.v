module square_calculator (
    input wire clk,
    input wire [7:0] x,
    output reg [15:0] x_squared
);

always @(posedge clk) begin
    x_squared <= x * x;
end

endmodule
