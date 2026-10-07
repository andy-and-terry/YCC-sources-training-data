module manchester_encoder (
    input wire clk,
    input wire rst_n,
    input wire data_in,
    output reg manchester_out
);

reg phase;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        phase <= 1'b0;
        manchester_out <= 1'b0;
    end else begin
        phase <= ~phase;
        // IEEE 802.3: 0 = high-to-low, 1 = low-to-high (data XOR clock phase)
        manchester_out <= data_in ^ phase;
    end
end

endmodule
