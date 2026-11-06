// Bulls and Cows: count positions where two 4-digit codes (4 bits per digit) match
module bulls_counter (
    input  wire [15:0] secret,
    input  wire [15:0] guess,
    output wire [2:0]  bulls
);

wire [3:0] match;

genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : g_digit
        assign match[i] = (secret[4*i +: 4] == guess[4*i +: 4]);
    end
endgenerate

assign bulls = match[0] + match[1] + match[2] + match[3];

endmodule
