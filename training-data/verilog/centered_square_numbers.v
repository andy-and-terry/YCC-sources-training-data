// Centered square numbers: n^2 + (n+1)^2.
module centered_square_numbers;
    integer n;

    initial begin
        for (n = 0; n < 10; n = n + 1) $write("%0d ", n * n + (n + 1) * (n + 1));
        $display("");
        $finish;
    end
endmodule
