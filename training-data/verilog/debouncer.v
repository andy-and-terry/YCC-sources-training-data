module debouncer #(
    parameter COUNTER_WIDTH = 16
) (
    input wire clk,
    input wire rst_n,
    input wire noisy_in,
    output reg clean_out
);

reg [COUNTER_WIDTH-1:0] counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
        clean_out <= 1'b0;
    end else if (noisy_in != clean_out) begin
        counter <= counter + 1;
        if (&counter) begin
            clean_out <= noisy_in;
        end
    end else begin
        counter <= 0;
    end
end

endmodule
