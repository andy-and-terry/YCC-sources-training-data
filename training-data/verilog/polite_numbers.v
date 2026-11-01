// Ways to write n as a sum of two or more consecutive positive integers.
module polite_numbers;
    function integer polite_ways(input integer n);
        integer k;
        begin
            polite_ways = 0;
            for (k = 2; k * (k + 1) / 2 <= n; k = k + 1)
                if ((n - k * (k - 1) / 2) % k == 0) polite_ways = polite_ways + 1;
        end
    endfunction

    integer n;
    initial begin
        for (n = 1; n <= 16; n = n + 1)
            $write("%0d ", polite_ways(n));
        $write("\n");
        $finish;
    end
endmodule
