module hamming_encoder_7_4 (
    input wire [3:0] data,   // {d4, d3, d2, d1}
    output wire [6:0] code   // {d4, d3, d2, p3, d1, p2, p1}
);

wire d1, d2, d3, d4;
assign d1 = data[0];
assign d2 = data[1];
assign d3 = data[2];
assign d4 = data[3];

wire p1, p2, p3;
assign p1 = d1 ^ d2 ^ d4;
assign p2 = d1 ^ d3 ^ d4;
assign p3 = d2 ^ d3 ^ d4;

assign code = {d4, d3, d2, p3, d1, p2, p1};

endmodule

module hamming_decoder_7_4 (
    input wire [6:0] code,   // {d4, d3, d2, p3, d1, p2, p1}
    output reg [3:0] data,   // corrected {d4, d3, d2, d1}
    output reg error
);

wire c1, c2, c3, c4, c5, c6, c7;
assign c1 = code[0];
assign c2 = code[1];
assign c3 = code[2];
assign c4 = code[3];
assign c5 = code[4];
assign c6 = code[5];
assign c7 = code[6];

wire s1, s2, s3;
assign s1 = c1 ^ c3 ^ c5 ^ c7;
assign s2 = c2 ^ c3 ^ c6 ^ c7;
assign s3 = c4 ^ c5 ^ c6 ^ c7;

wire [2:0] syndrome;
assign syndrome = {s3, s2, s1};

reg [6:0] corrected;

always @(*) begin
    corrected = code;
    error = |syndrome;
    if (syndrome != 3'b000) begin
        corrected[syndrome - 1] = ~code[syndrome - 1];
    end
    data = {corrected[6], corrected[5], corrected[4], corrected[2]};
end

endmodule
