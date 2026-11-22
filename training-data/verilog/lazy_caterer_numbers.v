// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
module lazy_caterer_numbers;
    integer n;
    initial begin
        for (n = 0; n < 10; n = n + 1)
            $write("%0d ", n * (n + 1) / 2 + 1);
        $write("\n");
        $finish;
    end
endmodule
