// Pentagonal numbers: n(3n-1)/2.
module pentagonal_numbers;
    integer n;

    initial begin
        for (n = 1; n <= 10; n = n + 1) $write("%0d ", n * (3 * n - 1) / 2);
        $display("");
        $finish;
    end
endmodule
