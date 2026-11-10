module twin_primes;
    function is_prime(input integer n);
        integer i;
        begin
            is_prime = (n >= 2);
            for (i = 2; i * i <= n; i = i + 1)
                if (n % i == 0) is_prime = 0;
        end
    endfunction

    integer p;
    initial begin
        for (p = 3; p <= 78; p = p + 1)
            if (is_prime(p) && is_prime(p + 2)) $write("(%0d,%0d) ", p, p + 2);
        $write("\n");  // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
    end
endmodule
