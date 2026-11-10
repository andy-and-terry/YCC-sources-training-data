module sophie_germain_primes;
    function is_prime(input integer n);
        integer i;
        begin
            is_prime = (n >= 2);
            for (i = 2; i * i <= n; i = i + 1)
                if (n % i == 0) is_prime = 0;
        end
    endfunction

    integer p, count;
    initial begin
        count = 0;
        for (p = 2; count < 10; p = p + 1)
            if (is_prime(p) && is_prime(2 * p + 1)) begin
                $write("%0d ", p);
                count = count + 1;
            end
        $write("\n");  // 2 3 5 11 23 29 41 53 83 89
    end
endmodule
