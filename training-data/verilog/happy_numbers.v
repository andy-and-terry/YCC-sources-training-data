// Digit-square-sum step for a 2-digit number; iterate it externally until 1 (happy) or a repeat.
module happy_numbers (
    input  wire [6:0] n,
    output wire [7:0] next,
    output wire       is_one
);

wire [3:0] tens = n / 10;
wire [3:0] ones = n % 10;

assign next   = tens * tens + ones * ones;
assign is_one = (n == 7'd1);

endmodule
