// Hexagonal numbers: n(2n-1).
module hexagonal_numbers;
    integer n;

    initial begin
        for (n = 1; n <= 10; n = n + 1) $write("%0d ", n * (2 * n - 1));
        $display("");
        $finish;
    end
endmodule
