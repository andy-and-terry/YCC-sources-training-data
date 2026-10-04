module manchester_encoder (
    input wire clk,
    input wire rst_n,
    input wire data_in,
    input wire data_valid,
    output reg manchester_out,
    output reg ready
);

// IEEE 802.3: 0 -> high-to-low, 1 -> low-to-high.
// Each data bit takes two clock cycles (two half-bit periods).
reg phase;
reg data_q;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        phase <= 1'b0;
        data_q <= 1'b0;
        manchester_out <= 1'b0;
        ready <= 1'b1;
    end else if (!phase) begin
        if (data_valid) begin
            data_q <= data_in;
            manchester_out <= ~data_in;
            phase <= 1'b1;
            ready <= 1'b0;
        end
    end else begin
        manchester_out <= data_q;
        phase <= 1'b0;
        ready <= 1'b1;
    end
end

endmodule
