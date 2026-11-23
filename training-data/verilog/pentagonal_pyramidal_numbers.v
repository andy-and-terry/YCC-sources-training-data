// n^2(n+1)/2
module pentagonal_pyramidal_numbers_tb;
    function integer term(input integer n);
        term = ((n * n) * (n + 1)) / 2;
    endfunction

    integer n;
    initial begin
        for (n = 1; n <= 15; n = n + 1)
            $display("%2d -> %0d", n, term(n));
        $finish;
    end
endmodule
