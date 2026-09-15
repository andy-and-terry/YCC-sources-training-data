module priority_arbiter_fixed #(
    parameter NUM_REQ = 4
) (
    input wire [NUM_REQ-1:0] request,
    output reg [NUM_REQ-1:0] grant
);

integer i;

always @(*) begin
    grant = {NUM_REQ{1'b0}};
    for (i = 0; i < NUM_REQ; i = i + 1) begin
        if (request[i] && (grant == {NUM_REQ{1'b0}})) begin
            grant[i] = 1'b1;
        end
    end
end

endmodule
