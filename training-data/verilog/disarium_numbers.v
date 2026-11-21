// Disarium numbers: digits raised to their 1-based positions sum to n.
module disarium_numbers;
    integer n;

    function is_disarium(input integer v);
        integer m, k, pos, d, p, i, total;
        begin
            k = 0;
            for (m = v; m > 0; m = m / 10) k = k + 1;
            total = 0;
            m = v;
            for (pos = k; pos > 0; pos = pos - 1) begin
                d = m % 10;
                p = 1;
                for (i = 0; i < pos; i = i + 1) p = p * d;
                total = total + p;
                m = m / 10;
            end
            is_disarium = (total == v);
        end
    endfunction

    initial begin
        for (n = 1; n < 1000; n = n + 1)
            if (is_disarium(n)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
