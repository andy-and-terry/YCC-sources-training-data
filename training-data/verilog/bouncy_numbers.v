// Bouncy numbers: digits are neither non-decreasing nor non-increasing.
// Count them below 1000 (expected 525).
module bouncy_numbers;
    integer n, count;

    function is_bouncy(input integer v);
        integer m, prev, d;
        reg inc, dec;
        begin
            inc = 1; dec = 1;
            prev = v % 10;
            m = v / 10;
            while (m > 0) begin
                d = m % 10;
                if (d > prev) inc = 0;
                if (d < prev) dec = 0;
                prev = d;
                m = m / 10;
            end
            is_bouncy = !inc && !dec;
        end
    endfunction

    initial begin
        count = 0;
        for (n = 1; n < 1000; n = n + 1)
            if (is_bouncy(n)) count = count + 1;
        $display("%0d", count);
        $finish;
    end
endmodule
