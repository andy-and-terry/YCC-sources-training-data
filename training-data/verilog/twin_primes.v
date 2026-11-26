// Twin primes below 100; expect 8. (simulation-only)
module twin_primes;
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
        for (p = 2; p < 100; p = p + 1)
            if (is_prime(p) && is_prime(p + 2)) c = c + 1;
        $display("%0d", c);
        $finish;
    end
endmodule
