module superperfect_numbers;
    function integer sigma(input integer n);
        integer d;
        begin
            sigma = 0;
            for (d = 1; d <= n; d = d + 1)
                if (n % d == 0) sigma = sigma + d;
        end
    endfunction

    integer n;
    initial begin
        for (n = 1; n < 100; n = n + 1)
            if (sigma(sigma(n)) == 2 * n) $write("%0d ", n);
        $write("\n");  // 2 4 16 64
    end
endmodule
