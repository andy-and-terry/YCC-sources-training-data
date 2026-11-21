// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
module keith_numbers;
    integer n;
    integer seq [0:63];   // arrays must live at module scope, not inside a function
    integer tmp [0:9];

    function is_keith(input integer v);
        integer k, len, m, i, total;
        begin
            k = 0;
            m = v;
            while (m > 0) begin
                tmp[k] = m % 10;
                k = k + 1;
                m = m / 10;
            end
            for (i = 0; i < k; i = i + 1) seq[i] = tmp[k - 1 - i];
            len = k;
            while (seq[len - 1] < v) begin
                total = 0;
                for (i = len - k; i < len; i = i + 1) total = total + seq[i];
                seq[len] = total;
                len = len + 1;
            end
            is_keith = (seq[len - 1] == v);
        end
    endfunction

    initial begin
        for (n = 10; n < 1200; n = n + 1)
            if (is_keith(n)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
