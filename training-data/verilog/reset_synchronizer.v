module reset_synchronizer (
    input wire clk,
    input wire async_rst_n,
    output wire sync_rst_n
);

reg [1:0] sync_stage;

always @(posedge clk or negedge async_rst_n) begin
    if (!async_rst_n) begin
        sync_stage <= 2'b00;
    end else begin
        sync_stage <= {sync_stage[0], 1'b1};
    end
end

assign sync_rst_n = sync_stage[1];

endmodule
