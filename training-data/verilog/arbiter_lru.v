module arbiter_lru #(
    parameter NUM_REQ = 4
) (
    input wire clk,
    input wire rst_n,
    input wire [NUM_REQ-1:0] request,
    output reg [NUM_REQ-1:0] grant
);

localparam IDX_W = $clog2(NUM_REQ);

reg [IDX_W-1:0] order [0:NUM_REQ-1];
reg [IDX_W-1:0] new_order [0:NUM_REQ-1];
integer i, j, k;
reg found;
reg [IDX_W-1:0] granted_id;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        grant <= {NUM_REQ{1'b0}};
        for (i = 0; i < NUM_REQ; i = i + 1) begin
            order[i] <= i[IDX_W-1:0];
        end
    end else begin
        grant <= {NUM_REQ{1'b0}};
        found = 1'b0;
        granted_id = {IDX_W{1'b0}};
        for (i = 0; i < NUM_REQ; i = i + 1) begin
            if (!found && request[order[i]]) begin
                granted_id = order[i];
                found = 1'b1;
            end
        end
        if (found) begin
            grant[granted_id] <= 1'b1;
            k = 0;
            for (j = 0; j < NUM_REQ; j = j + 1) begin
                if (order[j] != granted_id) begin
                    new_order[k] = order[j];
                    k = k + 1;
                end
            end
            new_order[NUM_REQ-1] = granted_id;
            for (j = 0; j < NUM_REQ; j = j + 1) begin
                order[j] <= new_order[j];
            end
        end
    end
end

endmodule
