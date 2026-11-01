// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
module ruth_aaron_pairs;
    function integer sopfr(input integer start);
        integer m, p;
        begin
            m = start;
            sopfr = 0;
            for (p = 2; p * p <= m; p = p + 1)
                while (m % p == 0) begin
                    sopfr = sopfr + p;
                    m = m / p;
                end
            if (m > 1) sopfr = sopfr + m;
        end
    endfunction

    integer n;
    initial begin
        for (n = 2; n < 110; n = n + 1)
            if (sopfr(n) == sopfr(n + 1)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
