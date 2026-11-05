module prio_enc (
    input  wire [3:0] req,
    output reg  [1:0] idx,
    output reg        valid
);
    always @(*) begin
        valid = 1'b1;
        casez (req)
            4'b1???: idx = 2'd3;
            4'b01??: idx = 2'd2;
            4'b001?: idx = 2'd1;
            4'b0001: idx = 2'd0;
            default: begin idx = 2'd0; valid = 1'b0; end
        endcase
    end
endmodule
