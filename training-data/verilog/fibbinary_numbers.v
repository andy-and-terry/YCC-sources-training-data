// Fibbinary numbers: no two adjacent 1 bits.
module fibbinary_numbers;
    integer n;

    initial begin
        for (n = 0; n < 50; n = n + 1)
            if ((n & (n >> 1)) == 0) $write("%0d ", n);
        $display("");
        $finish;
    end
endmodule
