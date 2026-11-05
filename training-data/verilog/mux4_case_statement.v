module mux4 (
    input  wire [1:0] sel,
    input  wire [3:0] in,
    output reg        out
);
    always @(*) begin
        case (sel)
            2'b00: out = in[0];
            2'b01: out = in[1];
            2'b10: out = in[2];
            default: out = in[3];
        endcase
    end
endmodule
