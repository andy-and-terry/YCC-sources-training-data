module one_shot_pulse_generator (
    input wire clk,
    input wire rst_n,
    input wire trigger,
    output reg pulse
);

reg prev_trigger;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        prev_trigger <= 1'b0;
        pulse <= 1'b0;
    end else begin
        prev_trigger <= trigger;
        pulse <= trigger & ~prev_trigger;
    end
end

endmodule
