module bcd_to_decimal_decoder (
    input wire [3:0] bcd_in,
    output reg [9:0] decimal_out
);

always @(*) begin
    case (bcd_in)
        4'd0: decimal_out = 10'b0000000001;
        4'd1: decimal_out = 10'b0000000010;
        4'd2: decimal_out = 10'b0000000100;
        4'd3: decimal_out = 10'b0000001000;
        4'd4: decimal_out = 10'b0000010000;
        4'd5: decimal_out = 10'b0000100000;
        4'd6: decimal_out = 10'b0001000000;
        4'd7: decimal_out = 10'b0010000000;
        4'd8: decimal_out = 10'b0100000000;
        4'd9: decimal_out = 10'b1000000000;
        default: decimal_out = 10'b0000000000;
    endcase
end

endmodule
