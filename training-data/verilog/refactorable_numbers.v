module refactorable_numbers;
    function integer tau(input integer n);
        integer d;
        begin
            tau = 0;
            for (d = 1; d <= n; d = d + 1)
                if (n % d == 0) tau = tau + 1;
        end
    endfunction

    integer n;
    initial begin
        for (n = 1; n < 60; n = n + 1)
            if (n % tau(n) == 0) $write("%0d ", n);
        $write("\n");  // 1 2 8 9 12 18 24 36 40 56
    end
endmodule
