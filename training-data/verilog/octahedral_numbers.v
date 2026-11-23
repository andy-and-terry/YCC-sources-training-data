// n(2n^2+1)/3
module octahedral_numbers_tb;
    function integer term(input integer n);
        term = (n * (((2 * n) * n) + 1)) / 3;
    endfunction

    integer n;
    initial begin
        for (n = 1; n <= 15; n = n + 1)
            $display("%2d -> %0d", n, term(n));
        $finish;
    end
endmodule
