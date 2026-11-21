// Carmichael numbers via Korselt's criterion: n is squarefree, composite,
// and p - 1 divides n - 1 for every prime factor p.
module carmichael_numbers;
    integer n;

    function is_carmichael(input integer v);
        integer m, p, count, ok;
        begin
            m = v;
            p = 2;
            count = 0;
            ok = 1;
            while (p * p <= m && ok) begin
                if (m % p == 0) begin
                    m = m / p;
                    if (m % p == 0) ok = 0;                 // not squarefree
                    else if ((v - 1) % (p - 1) != 0) ok = 0;
                    count = count + 1;
                end
                p = p + 1;
            end
            if (ok && m > 1) begin
                if ((v - 1) % (m - 1) != 0) ok = 0;
                count = count + 1;
            end
            is_carmichael = ok && (count >= 2);
        end
    endfunction

    initial begin
        for (n = 3; n < 3000; n = n + 2)
            if (is_carmichael(n)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
