module clock_divider #(
    parameter DIVISOR = 4
) (
    input wire clk_in,
    input wire rst_n,
    output reg clk_out
);

integer counter;

always @(posedge clk_in or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
        clk_out <= 1'b0;
    end else if (counter == DIVISOR - 1) begin
        counter <= 0;
        clk_out <= ~clk_out;
    end else begin
        counter <= counter + 1;
    end
end

endmodule
