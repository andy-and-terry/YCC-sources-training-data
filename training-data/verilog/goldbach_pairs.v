// Goldbach partitions of 100; expect 6. (simulation-only)
module goldbach_pairs;
    integer c, p;
    function integer is_prime(input integer n);
        integer d;
        begin
            is_prime = (n >= 2);
            for (d = 2; d * d <= n; d = d + 1)
                if (n % d == 0) is_prime = 0;
        end
    endfunction

    initial begin
        c = 0;
        for (p = 2; p <= 50; p = p + 1)
            if (is_prime(p) && is_prime(100 - p)) c = c + 1;
        $display("%0d", c);
        $finish;
    end
endmodule
