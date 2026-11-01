// Leyland numbers: x^y + y^x for x >= y >= 2 (testbench-style, prints a list).
module leyland_numbers;
    function integer ipow(input integer b, input integer e);
        integer i;
        begin
            ipow = 1;
            for (i = 0; i < e; i = i + 1) ipow = ipow * b;
        end
    endfunction

    integer x, y;
    initial begin
        for (x = 2; x <= 4; x = x + 1)
            for (y = 2; y <= x; y = y + 1)
                $write("%0d ", ipow(x, y) + ipow(y, x));
        $write("\n");
        $finish;
    end
endmodule
