// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
module munchausen_numbers;
    integer n;

    function is_munchausen(input integer v);
        integer m, d, p, i, total;
        begin
            total = 0;
            m = v;
            while (m > 0) begin
                d = m % 10;
                if (d > 0) begin
                    p = 1;
                    for (i = 0; i < d; i = i + 1) p = p * d;
                    total = total + p;
                end
                m = m / 10;
            end
            is_munchausen = (total == v);
        end
    endfunction

    initial begin
        for (n = 1; n < 5000; n = n + 1)
            if (is_munchausen(n)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
