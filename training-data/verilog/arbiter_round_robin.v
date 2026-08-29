module arbiter_round_robin #(
    parameter NUM_REQ = 4
) (
    input wire clk,
    input wire rst_n,
    input wire [NUM_REQ-1:0] request,
    output reg [NUM_REQ-1:0] grant
);

reg [$clog2(NUM_REQ)-1:0] pointer;
integer i, idx;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pointer <= 0;
        grant <= 0;
    end else begin
        grant <= 0;
        for (i = 0; i < NUM_REQ; i = i + 1) begin
            idx = (pointer + i) % NUM_REQ;
            if (request[idx]) begin
                grant[idx] <= 1'b1;
                pointer <= (idx + 1) % NUM_REQ;
                i = NUM_REQ;
            end
        end
    end
end

endmodule
