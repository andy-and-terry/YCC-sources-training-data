// Positive n expressible as a*a + b*b with a, b >= 0.
module sum_of_two_squares;
    function representable(input integer n);
        integer a, b;
        begin
            representable = 0;
            for (a = 0; a * a <= n; a = a + 1)
                for (b = a; a * a + b * b <= n; b = b + 1)
                    if (a * a + b * b == n) representable = 1;
        end
    endfunction

    integer n;
    initial begin
        for (n = 1; n <= 30; n = n + 1)
            if (representable(n)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
