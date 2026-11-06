// Number of Roman symbols needed for a single decimal digit (0..9):
// 0->0, 1->I, 2->II, 3->III, 4->IV, 5->V, 6->VI, 7->VII, 8->VIII, 9->IX
module roman_digit_length (
    input  wire [3:0] digit,
    output reg  [2:0] symbols
);

always @* begin
    case (digit)
        4'd0:    symbols = 3'd0;
        4'd1:    symbols = 3'd1;
        4'd2:    symbols = 3'd2;
        4'd3:    symbols = 3'd3;
        4'd4:    symbols = 3'd2;
        4'd5:    symbols = 3'd1;
        4'd6:    symbols = 3'd2;
        4'd7:    symbols = 3'd3;
        4'd8:    symbols = 3'd4;
        4'd9:    symbols = 3'd2;
        default: symbols = 3'd0;
    endcase
end

endmodule
