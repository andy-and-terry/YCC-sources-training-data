module saturating_counter #(
    parameter WIDTH = 4,
    parameter MAX_VAL = 15
) (
    input wire clk,
    input wire rst_n,
    input wire increment,
    input wire decrement,
    output reg [WIDTH-1:0] count
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
    end else if (increment && count < MAX_VAL) begin
        count <= count + 1;
    end else if (decrement && count > 0) begin
        count <= count - 1;
    end
end

endmodule
