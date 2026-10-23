module display_format_specifiers_demo;
    reg [7:0] value;
    reg signed [7:0] sval;
    reg [15:0] word;
    reg [3:0] x;

    initial begin
        value = 8'hA5;
        sval  = -8'sd5;
        word  = 16'hBEEF;
        x     = 4'b10xz;

        $display("bin: %b  oct: %o  dec: %d  hex: %h", value, value, value, value);
        $display("padded dec: [%5d] [%-5d] [%0d]", value, value, value);
        $display("signed: %d  unsigned view: %0d", sval, sval[7:0]);
        $display("hex upper nibble: %h, word: %04h", value[7:4], word);
        $display("with x/z: %b hex=%h", x, x);
        $display("char: %c  string: %s", 8'd65, "ok");
        #5;
        $display("time: %0t  %t", $time, $time);
        $write("no newline, ");
        $write("then newline\n");
        $strobe("strobe sees value=%h", value);
        value = 8'h00;
        #1 $finish;
    end
endmodule
