// Maps a spreadsheet column number 1..26 to its ASCII letter ('A'..'Z').
module column_label_decoder (
    input wire [4:0] column,
    output reg [7:0] letter,
    output reg valid
);

always @(*) begin
    valid = (column >= 5'd1) && (column <= 5'd26);
    letter = valid ? (8'd64 + column) : 8'h00;
end

endmodule
