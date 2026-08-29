module watchdog_timer #(
    parameter TIMEOUT = 1000
) (
    input wire clk,
    input wire rst_n,
    input wire kick,
    output reg timeout_flag
);

integer counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
        timeout_flag <= 1'b0;
    end else if (kick) begin
        counter <= 0;
        timeout_flag <= 1'b0;
    end else if (counter >= TIMEOUT) begin
        timeout_flag <= 1'b1;
    end else begin
        counter <= counter + 1;
    end
end

endmodule
