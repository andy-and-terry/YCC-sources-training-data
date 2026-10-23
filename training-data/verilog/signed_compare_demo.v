// Same bit pattern compared as unsigned and as signed
module signed_compare_demo (
    input  [7:0] a,
    input  [7:0] b,
    output       lt_unsigned,
    output       lt_signed,
    output signed [8:0] diff
);
    wire signed [7:0] sa = a;
    wire signed [7:0] sb = b;

    assign lt_unsigned = (a < b);
    assign lt_signed   = (sa < sb);
    assign diff        = sa - sb;   // 9 bits avoids overflow
endmodule

module tb;
    reg  [7:0] a, b;
    wire lt_u, lt_s;
    wire signed [8:0] diff;

    signed_compare_demo dut (a, b, lt_u, lt_s, diff);

    initial begin
        a = 8'hFF; b = 8'h01; #1;   // 255 vs 1 unsigned, -1 vs 1 signed
        $display("a=%0d b=%0d lt_u=%b lt_s=%b diff=%0d", a, b, lt_u, lt_s, diff);
        a = 8'h05; b = 8'h80; #1;
        $display("a=%0d b=%0d lt_u=%b lt_s=%b diff=%0d", a, b, lt_u, lt_s, diff);
        $finish;
    end
endmodule
