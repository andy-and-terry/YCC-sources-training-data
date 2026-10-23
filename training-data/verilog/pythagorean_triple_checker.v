module pythagorean_triple_checker (
    input  [7:0] a,
    input  [7:0] b,
    input  [7:0] c,
    output       is_triple
);
    wire [15:0] a2 = a * a;
    wire [15:0] b2 = b * b;
    wire [15:0] c2 = c * c;

    assign is_triple = (a2 + b2 == c2);
endmodule

module tb;
    reg [7:0] a, b, c;
    wire ok;

    pythagorean_triple_checker dut (.a(a), .b(b), .c(c), .is_triple(ok));

    initial begin
        a = 3; b = 4; c = 5; #1 $display("%0d %0d %0d -> %b", a, b, c, ok);
        a = 5; b = 12; c = 13; #1 $display("%0d %0d %0d -> %b", a, b, c, ok);
        a = 4; b = 5; c = 6; #1 $display("%0d %0d %0d -> %b", a, b, c, ok);
    end
endmodule
