// Twin primes: pairs (p, p+2) both prime (simulation-only).
module twin_primes;
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
            if (is_prime(p) && is_prime(p + 2)) $write("%0d ", p);
        $write("\n");
        $finish;
    end
endmodule
