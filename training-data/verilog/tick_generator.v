module tick_generator #(
    parameter CLK_FREQ_HZ = 50_000_000,
    parameter TICK_FREQ_HZ = 1_000
) (
    input wire clk,
    input wire rst_n,
    input wire enable,
    output reg tick
);

localparam DIVISOR = CLK_FREQ_HZ / TICK_FREQ_HZ;
localparam CNT_WIDTH = $clog2(DIVISOR);

reg [CNT_WIDTH-1:0] counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= {CNT_WIDTH{1'b0}};
        tick <= 1'b0;
    end else if (!enable) begin
        counter <= {CNT_WIDTH{1'b0}};
        tick <= 1'b0;
    end else if (counter == DIVISOR - 1) begin
        counter <= {CNT_WIDTH{1'b0}};
        tick <= 1'b1;
    end else begin
        counter <= counter + 1'b1;
        tick <= 1'b0;
    end
end

endmodule
