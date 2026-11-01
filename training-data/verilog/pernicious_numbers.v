// Pernicious numbers: the popcount is prime.
module pernicious_numbers;
    function integer popcount(input integer v);
        integer i;
        begin
            popcount = 0;
            for (i = 0; i < 32; i = i + 1) popcount = popcount + v[i];
        end
    endfunction

    function is_prime(input integer k);
        integer d;
        begin
            is_prime = (k >= 2);
            for (d = 2; d * d <= k; d = d + 1)
                if (k % d == 0) is_prime = 0;
        end
    endfunction

    integer n;
    initial begin
        for (n = 1; n <= 20; n = n + 1)
            if (is_prime(popcount(n))) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
