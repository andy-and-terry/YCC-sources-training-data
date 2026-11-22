// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
module lah_numbers;
    integer k;

    function integer fact(input integer m);
        integer i;
        begin
            fact = 1;
            for (i = 2; i <= m; i = i + 1) fact = fact * i;
        end
    endfunction

    function integer comb(input integer m, input integer j);
        begin
            comb = fact(m) / (fact(j) * fact(m - j));
        end
    endfunction

    initial begin
        for (k = 1; k <= 5; k = k + 1)
            $write("%0d ", comb(4, k - 1) * fact(5) / fact(k));
        $write("\n");
        $finish;
    end
endmodule
