// Deficient numbers below 100; expect 76. (simulation-only)
module deficient_numbers;
    integer c, n;
    function integer proper_sum(input integer n);
        integer d;
        begin
            proper_sum = 0;
            for (d = 1; d < n; d = d + 1)
                if (n % d == 0) proper_sum = proper_sum + d;
        end
    endfunction

    initial begin
        c = 0;
        for (n = 1; n < 100; n = n + 1)
            if (proper_sum(n) < n) c = c + 1;
        $display("%0d", c);
        $finish;
    end
endmodule
