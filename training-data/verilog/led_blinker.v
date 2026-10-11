module led_blinker #(
    parameter CLK_HZ = 50_000_000
) (
    input wire clk,
    input wire rst_n,
    output reg led
);

localparam HALF_PERIOD = CLK_HZ / 2;
reg [31:0] ticks;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ticks <= 32'd0;
        led <= 1'b0;
    end else if (ticks == HALF_PERIOD - 1) begin
        ticks <= 32'd0;
        led <= ~led;
    end else begin
        ticks <= ticks + 1'b1;
    end
end

endmodule
