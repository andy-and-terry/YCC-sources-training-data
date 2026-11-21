// Cantor pairing function and its inverse (combinational module + testbench).
module cantor_pair (
    input  wire [15:0] x,
    input  wire [15:0] y,
    output wire [31:0] z
);
    wire [31:0] s = x + y;
    assign z = (s * (s + 1)) / 2 + y;
endmodule

module cantor_pairing;
    reg  [15:0] x, y;
    wire [31:0] z;
    integer     w, uy, ux;

    cantor_pair dut (.x(x), .y(y), .z(z));

    initial begin
        x = 3; y = 4; #1;
        $display("%0d", z);                        // 32
        // inverse of 32: w = (isqrt(8z+1) - 1) / 2
        w = (($rtoi($sqrt(8.0 * 32 + 1))) - 1) / 2;
        uy = 32 - w * (w + 1) / 2;
        ux = w - uy;
        $display("%0d %0d", ux, uy);               // 3 4
        $finish;
    end
endmodule
