// Emirps below 200; expect 15. (simulation-only)
module emirps;
    integer c, n, r;
    function integer is_prime(input integer n);
        integer d;
        begin
            is_prime = (n >= 2);
            for (d = 2; d * d <= n; d = d + 1)
                if (n % d == 0) is_prime = 0;
        end
    endfunction

    function integer rev(input integer n);
        integer m;
        begin
            rev = 0;
            m = n;
            while (m > 0) begin
                rev = rev * 10 + m % 10;
                m = m / 10;
            end
        end
    endfunction

    initial begin
        c = 0;
        for (n = 2; n < 200; n = n + 1) begin
            r = rev(n);
            if (r != n && is_prime(n) && is_prime(r)) c = c + 1;
        end
        $display("%0d", c);
        $finish;
    end
endmodule
