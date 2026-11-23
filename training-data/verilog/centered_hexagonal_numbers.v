// 3n(n-1)+1
module centered_hexagonal_numbers_tb;
    function integer term(input integer n);
        term = ((3 * n) * (n - 1)) + 1;
    endfunction

    integer n;
    initial begin
        for (n = 1; n <= 15; n = n + 1)
            $display("%2d -> %0d", n, term(n));
        $finish;
    end
endmodule
