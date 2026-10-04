module rising_edge_counter #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire signal_in,
    output reg [WIDTH-1:0] count
);

reg sync_0, sync_1, prev;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sync_0 <= 1'b0;
        sync_1 <= 1'b0;
        prev <= 1'b0;
        count <= {WIDTH{1'b0}};
    end else begin
        sync_0 <= signal_in;
        sync_1 <= sync_0;
        prev <= sync_1;
        if (clear)
            count <= {WIDTH{1'b0}};
        else if (sync_1 && !prev)
            count <= count + 1'b1;
    end
end

endmodule
