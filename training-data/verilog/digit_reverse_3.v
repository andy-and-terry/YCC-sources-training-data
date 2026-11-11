// Reverse the decimal digits of a number in 0..999 (building block of an emirp check)
module digit_reverse_3 (
    input  wire [9:0] n,
    output wire [9:0] reversed
);

wire [3:0] hundreds = n / 100;
wire [3:0] tens     = (n / 10) % 10;
wire [3:0] ones     = n % 10;

assign reversed = ones * 100 + tens * 10 + hundreds;

endmodule
