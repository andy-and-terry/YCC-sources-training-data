// Cake numbers (n^3 + 5n + 6) / 6 using a function.
module cake_numbers;
    function integer cake(input integer n);
        cake = (n * n * n + 5 * n + 6) / 6;
    endfunction

    integer n;
    initial begin
        for (n = 0; n < 10; n = n + 1) $write("%0d ", cake(n));
        $write("\n");  // 1 2 4 8 15 26 42 64 93 130
    end
endmodule
