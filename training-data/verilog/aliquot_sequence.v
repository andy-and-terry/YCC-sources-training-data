// Aliquot sequence: replace n by the sum of its proper divisors.
module aliquot_sequence;
    integer n, count;

    function integer aliquot_sum(input integer v);
        integer d, s;
        begin
            s = 0;
            for (d = 1; d <= v / 2; d = d + 1)
                if (v % d == 0) s = s + d;
            aliquot_sum = s;
        end
    endfunction

    initial begin
        n = 12;
        count = 0;
        $write("%0d ", n);
        while (n > 1 && count < 19) begin
            n = aliquot_sum(n);
            $write("%0d ", n);
            count = count + 1;
        end
        $display("");
        $finish;
    end
endmodule
