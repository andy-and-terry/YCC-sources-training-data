// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
module mobius_function;
    integer n;

    function integer mobius(input integer v);
        integer m, p, res;
        reg done;
        begin
            m = v; p = 2; res = 1; done = 0;
            while (!done && p * p <= m) begin
                if (m % p == 0) begin
                    m = m / p;
                    if (m % p == 0) begin
                        res = 0;
                        done = 1;
                    end else res = -res;
                end
                p = p + 1;
            end
            if (!done && m > 1) res = -res;
            mobius = res;
        end
    endfunction

    initial begin
        for (n = 1; n <= 30; n = n + 1) $write("%0d ", mobius(n));
        $display("");
        $finish;
    end
endmodule
