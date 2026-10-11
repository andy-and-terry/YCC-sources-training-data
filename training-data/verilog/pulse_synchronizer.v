module pulse_synchronizer (
    input wire clk_a,
    input wire rst_a_n,
    input wire pulse_a,
    input wire clk_b,
    input wire rst_b_n,
    output wire pulse_b
);

reg toggle_a;
reg [2:0] sync_b;

always @(posedge clk_a or negedge rst_a_n) begin
    if (!rst_a_n)
        toggle_a <= 1'b0;
    else if (pulse_a)
        toggle_a <= ~toggle_a;
end

always @(posedge clk_b or negedge rst_b_n) begin
    if (!rst_b_n)
        sync_b <= 3'b000;
    else
        sync_b <= {sync_b[1:0], toggle_a};
end

assign pulse_b = sync_b[2] ^ sync_b[1];

endmodule
