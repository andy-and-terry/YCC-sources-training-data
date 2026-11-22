// Emirps: primes whose digit reversal is a different prime (simulation-only).
module emirp_numbers;
    integer n, r;

    function integer is_prime(input integer k);
        integer d;
        begin
            is_prime = (k >= 2);
            for (d = 2; d * d <= k; d = d + 1)
                if (k % d == 0) is_prime = 0;
        end
    endfunction

    function integer reverse_num(input integer k);
        integer m;
        begin
            m = k;
            reverse_num = 0;
            while (m > 0) begin
                reverse_num = reverse_num * 10 + m % 10;
                m = m / 10;
            end
        end
    endfunction

    initial begin
        for (n = 2; n < 200; n = n + 1) begin
            r = reverse_num(n);
            if (r != n && is_prime(n) && is_prime(r)) $write("%0d ", n);
        end
        $write("\n");
        $finish;
    end
endmodule
