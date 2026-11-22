// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
module practical_numbers;
    integer n;

    function is_practical(input integer k);
        reg [63:0] reach, mask;
        integer d;
        begin
            reach = 1;   // bit i set <=> i is a subset sum
            for (d = 1; d <= k; d = d + 1)
                if (k % d == 0) reach = reach | (reach << d);
            mask = (64'd1 << (k + 1)) - 1;
            is_practical = ((reach & mask) == mask);
        end
    endfunction

    initial begin
        for (n = 1; n <= 40; n = n + 1)
            if (is_practical(n)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
