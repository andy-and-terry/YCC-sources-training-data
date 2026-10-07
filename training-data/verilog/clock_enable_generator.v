module clock_enable_generator #(
    parameter DIV = 10
) (
    input wire clk,
    input wire rst_n,
    output reg tick
);

// Single-cycle enable pulse every DIV clocks; avoids derived clocks
reg [$clog2(DIV)-1:0] cnt;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 0;
        tick <= 1'b0;
    end else if (cnt == DIV - 1) begin
        cnt <= 0;
        tick <= 1'b1;
    end else begin
        cnt <= cnt + 1'b1;
        tick <= 1'b0;
    end
end

endmodule
