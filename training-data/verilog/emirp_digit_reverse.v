module emirp_digit_reverse (
    input  wire [6:0] n,        // 0..99
    output wire [6:0] reversed
);

wire [3:0] tens = n / 10;
wire [3:0] ones = n % 10;
assign reversed = ones * 10 + tens;

endmodule
