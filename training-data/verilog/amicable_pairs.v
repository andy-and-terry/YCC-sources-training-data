// Amicable pairs below 1500 via sums of proper divisors (simulation-only).
module amicable_pairs;
    integer a, b;

    function integer s(input integer n);
        integer d, t;
        begin
            t = 0;
            for (d = 1; d < n; d = d + 1)
                if (n % d == 0) t = t + d;
            s = t;
        end
    endfunction

    initial begin
        for (a = 2; a < 1500; a = a + 1) begin
            b = s(a);
            if (b > a && s(b) == a) $display("%0d %0d", a, b);
        end
        $finish;
    end
endmodule
