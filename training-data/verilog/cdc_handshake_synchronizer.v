module cdc_handshake_synchronizer (
    input wire clk_src,
    input wire rst_src_n,
    input wire pulse_in,
    input wire clk_dst,
    input wire rst_dst_n,
    output wire pulse_out
);

reg toggle_src;
reg [2:0] sync_dst;

always @(posedge clk_src or negedge rst_src_n) begin
    if (!rst_src_n) begin
        toggle_src <= 1'b0;
    end else if (pulse_in) begin
        toggle_src <= ~toggle_src;
    end
end

always @(posedge clk_dst or negedge rst_dst_n) begin
    if (!rst_dst_n) begin
        sync_dst <= 3'b0;
    end else begin
        sync_dst <= {sync_dst[1:0], toggle_src};
    end
end

assign pulse_out = sync_dst[2] ^ sync_dst[1];

endmodule
