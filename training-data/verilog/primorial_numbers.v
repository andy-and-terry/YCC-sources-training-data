// Primorials up to 1e6, including 1; expect 8. (simulation-only)
module primorial_numbers;
    integer c, p, acc;
    function integer is_prime(input integer n);
        integer d;
        begin
            is_prime = (n >= 2);
            for (d = 2; d * d <= n; d = d + 1)
                if (n % d == 0) is_prime = 0;
        end
    endfunction

    initial begin
        c = 1;
        acc = 1;
        p = 2;
        while (acc * p <= 1000000 || !is_prime(p)) begin
            if (is_prime(p)) begin
                acc = acc * p;
                c = c + 1;
            end
            p = p + 1;
        end
        $display("%0d", c);
        $finish;
    end
endmodule
