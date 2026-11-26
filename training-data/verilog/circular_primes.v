// Circular primes below 100 (one- and two-digit rotations); expect 13. (simulation-only)
module circular_primes;
    integer c, n;
    function integer is_prime(input integer n);
        integer d;
        begin
            is_prime = (n >= 2);
            for (d = 2; d * d <= n; d = d + 1)
                if (n % d == 0) is_prime = 0;
        end
    endfunction

    function integer circular(input integer n);
        begin
            if (n < 10) circular = is_prime(n);
            else circular = is_prime(n) && is_prime((n % 10) * 10 + n / 10);
        end
    endfunction

    initial begin
        c = 0;
        for (n = 2; n < 100; n = n + 1)
            if (circular(n)) c = c + 1;
        $display("%0d", c);
        $finish;
    end
endmodule
