// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
module perfect_totient_numbers;
    integer n, m, total;

    function integer gcd(input integer a0, input integer b0);
        integer a, b, t;
        begin
            a = a0; b = b0;
            while (b != 0) begin
                t = a % b;
                a = b;
                b = t;
            end
            gcd = a;
        end
    endfunction

    function integer phi(input integer v);
        integer k, c;
        begin
            c = 0;
            for (k = 1; k <= v; k = k + 1)
                if (gcd(k, v) == 1) c = c + 1;
            phi = c;
        end
    endfunction

    initial begin
        for (n = 2; n < 200; n = n + 1) begin
            total = 0;
            m = n;
            while (m > 1) begin
                m = phi(m);
                total = total + m;
            end
            if (total == n) $write("%0d ", n);
        end
        $write("\n");
        $finish;
    end
endmodule
