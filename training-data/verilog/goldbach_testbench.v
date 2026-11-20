// Testbench: find the Goldbach pair for 28 with a function.
module goldbach_testbench;
    function is_prime(input integer n);
        integer d;
        begin
            is_prime = (n > 1);
            for (d = 2; d * d <= n; d = d + 1)
                if (n % d == 0) is_prime = 0;
        end
    endfunction
    integer p;
    reg found;
    initial begin
        found = 0;
        for (p = 2; p <= 14 && !found; p = p + 1)
            if (is_prime(p) && is_prime(28 - p)) begin
                $display("%0d + %0d", p, 28 - p);
                found = 1;
            end
    end
endmodule
