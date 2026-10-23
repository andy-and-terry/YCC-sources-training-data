module casex_priority_encoder (
    input wire [3:0] req,
    output reg [1:0] grant_idx,
    output reg valid
);

always @(*) begin
    valid = 1'b1;
    casex (req)
        4'b1xxx: grant_idx = 2'd3;
        4'b01xx: grant_idx = 2'd2;
        4'b001x: grant_idx = 2'd1;
        4'b0001: grant_idx = 2'd0;
        default: begin
            grant_idx = 2'd0;
            valid = 1'b0;
        end
    endcase
end

endmodule
