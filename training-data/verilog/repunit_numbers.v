// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
module repunit_numbers;
    integer n;
    integer r;

    initial begin
        r = 0;
        for (n = 1; n <= 8; n = n + 1) begin
            r = r * 10 + 1;
            if (r % 3 == 0) $display("%0d  (divisible by 3)", r);
            else $display("%0d", r);
        end
        $finish;
    end
endmodule
