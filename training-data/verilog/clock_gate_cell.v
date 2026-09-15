module clock_gate_cell (
    input wire clk,
    input wire enable,
    output wire gated_clk
);

reg enable_latch;

always @(*) begin
    if (!clk)
        enable_latch = enable;
end

assign gated_clk = clk & enable_latch;

endmodule
