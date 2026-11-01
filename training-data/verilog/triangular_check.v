// n is triangular iff 8n + 1 is a perfect square.
module triangular_check;
    function is_triangular(input integer n);
        integer s, r;
        begin
            s = 8 * n + 1;
            r = 0;
            while ((r + 1) * (r + 1) <= s) r = r + 1;
            is_triangular = (r * r == s);
        end
    endfunction

    integer n;
    initial begin
        for (n = 0; n <= 20; n = n + 1)
            if (is_triangular(n)) $write("%0d ", n);
        $write("\n");
        $finish;
    end
endmodule
