module ripple_counter_async (
    input wire clk,
    input wire rst_n,
    output wire [3:0] q
);

reg [3:0] r;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) r[0] <= 1'b0;
    else r[0] <= ~r[0];
end

always @(negedge r[0] or negedge rst_n) begin
    if (!rst_n) r[1] <= 1'b0;
    else r[1] <= ~r[1];
end

always @(negedge r[1] or negedge rst_n) begin
    if (!rst_n) r[2] <= 1'b0;
    else r[2] <= ~r[2];
end

always @(negedge r[2] or negedge rst_n) begin
    if (!rst_n) r[3] <= 1'b0;
    else r[3] <= ~r[3];
end

assign q = r;

endmodule
