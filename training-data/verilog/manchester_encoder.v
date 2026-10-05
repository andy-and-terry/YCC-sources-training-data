// IEEE 802.3 Manchester: 0 = high-to-low, 1 = low-to-high, one bit per clk cycle.
module manchester_encoder (
    input wire clk,
    input wire rst_n,
    input wire data_in,
    input wire data_valid,
    output reg line_out
);

reg half;
reg latched;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        half <= 1'b0;
        latched <= 1'b0;
        line_out <= 1'b0;
    end else if (data_valid) begin
        if (!half) begin
            latched <= data_in;
            line_out <= ~data_in;   // first half
            half <= 1'b1;
        end else begin
            line_out <= latched;    // second half
            half <= 1'b0;
        end
    end
end

endmodule
