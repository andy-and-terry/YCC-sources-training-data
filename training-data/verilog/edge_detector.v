module edge_detector (
    input wire clk,
    input wire rst_n,
    input wire signal_in,
    output wire rising_edge,
    output wire falling_edge
);

reg prev;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        prev <= 1'b0;
    end else begin
        prev <= signal_in;
    end
end

assign rising_edge = signal_in & ~prev;
assign falling_edge = ~signal_in & prev;

endmodule
