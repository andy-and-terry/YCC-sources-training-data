// 16-entry quarter-resolution sine table, 8-bit unsigned output centered at 128.
module sine_rom_lookup (
    input wire clk,
    input wire [3:0] phase,
    output reg [7:0] sample
);

always @(posedge clk) begin
    case (phase)
        4'd0:  sample <= 8'd128;
        4'd1:  sample <= 8'd177;
        4'd2:  sample <= 8'd218;
        4'd3:  sample <= 8'd246;
        4'd4:  sample <= 8'd255;
        4'd5:  sample <= 8'd246;
        4'd6:  sample <= 8'd218;
        4'd7:  sample <= 8'd177;
        4'd8:  sample <= 8'd128;
        4'd9:  sample <= 8'd79;
        4'd10: sample <= 8'd38;
        4'd11: sample <= 8'd10;
        4'd12: sample <= 8'd1;
        4'd13: sample <= 8'd10;
        4'd14: sample <= 8'd38;
        default: sample <= 8'd79;
    endcase
end

endmodule
