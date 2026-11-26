// Squarefree numbers up to 100; expect 61. (simulation-only)
module squarefree_numbers;
    integer c, n;
    function integer squarefree(input integer n);
        integer d;
        begin
            squarefree = 1;
            for (d = 2; d * d <= n; d = d + 1)
                if (n % (d * d) == 0) squarefree = 0;
        end
    endfunction

    initial begin
        c = 0;
        for (n = 1; n <= 100; n = n + 1)
            c = c + squarefree(n);
        $display("%0d", c);
        $finish;
    end
endmodule
