module clock_gate (
    input wire clk,
    input wire enable,
    output wire gated_clk
);

reg enable_latched;

always @(*) begin
    if (!clk)
        enable_latched = enable;
end

assign gated_clk = clk & enable_latched;

endmodule
