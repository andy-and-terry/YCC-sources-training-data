module synchronizer_2ff (
    input wire clk,
    input wire rst_n,
    input wire async_in,
    output wire sync_out
);

reg meta_stage, sync_stage;

assign sync_out = sync_stage;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        meta_stage <= 1'b0;
        sync_stage <= 1'b0;
    end else begin
        meta_stage <= async_in;
        sync_stage <= meta_stage;
    end
end

endmodule
