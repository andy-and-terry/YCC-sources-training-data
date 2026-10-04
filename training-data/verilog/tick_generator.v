module tick_generator #(
    parameter CLK_HZ = 50_000_000,
    parameter TICK_HZ = 1000
) (
    input wire clk,
    input wire rst_n,
    input wire enable,
    output reg tick
);

localparam DIVISOR = CLK_HZ / TICK_HZ;
localparam CW = $clog2(DIVISOR);

reg [CW-1:0] count;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
        tick <= 1'b0;
    end else if (!enable) begin
        count <= 0;
        tick <= 1'b0;
    end else if (count == DIVISOR - 1) begin
        count <= 0;
        tick <= 1'b1;
    end else begin
        count <= count + 1'b1;
        tick <= 1'b0;
    end
end

endmodule
