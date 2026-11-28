// y = (5*x + 8) mod 26 for a letter index 0..25
module affine_letter (
    input  wire [4:0] x,
    output wire [4:0] y
);
    wire [8:0] t = 9'd5 * x + 9'd8;
    assign y = t % 26;
endmodule
