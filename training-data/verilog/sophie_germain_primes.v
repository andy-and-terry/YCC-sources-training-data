// Sophie Germain primes: p prime and 2p + 1 prime (simulation-only).
module sophie_germain_primes;
    integer p;

    function integer is_prime(input integer k);
        integer d;
        begin
            is_prime = (k >= 2);
            for (d = 2; d * d <= k; d = d + 1)
                if (k % d == 0) is_prime = 0;
        end
    endfunction

    initial begin
        for (p = 2; p < 100; p = p + 1)
            if (is_prime(p) && is_prime(2 * p + 1)) $write("%0d ", p);
        $write("\n");
        $finish;
    end
endmodule
