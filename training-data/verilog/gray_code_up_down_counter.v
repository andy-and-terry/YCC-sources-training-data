module gray_code_up_down_counter #(
    parameter WIDTH = 4
) (
    input wire clk,
    input wire rst_n,
    input wire up_down,
    output reg [WIDTH-1:0] gray_out
);

reg [WIDTH-1:0] binary_count;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        binary_count <= {WIDTH{1'b0}};
        gray_out <= {WIDTH{1'b0}};
    end else if (up_down) begin
        binary_count <= binary_count + 1'b1;
        gray_out <= (binary_count + 1'b1) ^ ((binary_count + 1'b1) >> 1);
    end else begin
        binary_count <= binary_count - 1'b1;
        gray_out <= (binary_count - 1'b1) ^ ((binary_count - 1'b1) >> 1);
    end
end

endmodule
