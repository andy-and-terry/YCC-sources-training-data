module digit_square_sum (
    input  [9:0] n,
    output [11:0] total
);
    wire [3:0] d0 = n % 10;
    wire [3:0] d1 = (n / 10) % 10;
    wire [3:0] d2 = (n / 100) % 10;
    assign total = d0 * d0 + d1 * d1 + d2 * d2;
endmodule
