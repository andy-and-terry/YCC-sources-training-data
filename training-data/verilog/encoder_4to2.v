module encoder_4to2 (
    input wire [3:0] in,
    output reg [1:0] out,
    output reg valid
);

always @(*) begin
    valid = 1'b1;
    case (in)
        4'b0001: out = 2'd0;
        4'b0010: out = 2'd1;
        4'b0100: out = 2'd2;
        4'b1000: out = 2'd3;
        default: begin
            out = 2'd0;
            valid = 1'b0;
        end
    endcase
end

endmodule
