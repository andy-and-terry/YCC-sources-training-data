module pwm_generator #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire [WIDTH-1:0] duty_cycle,
    output reg pwm_out
);

reg [WIDTH-1:0] counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
    end else begin
        counter <= counter + 1;
    end
end

always @(*) begin
    pwm_out = (counter < duty_cycle);
end

endmodule
