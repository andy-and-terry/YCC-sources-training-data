module powerful_numbers;
function is_powerful(input integer value);
    integer n, p;
    reg ok;
    begin
        n = value;
        p = 2;
        ok = 1;
        while (p * p <= n && ok) begin
            if (n % p == 0) begin
                if (n % (p * p) != 0) ok = 0;
                else while (n % p == 0) n = n / p;
            end
            p = p + 1;
        end
        is_powerful = ok && (n == 1);
    end
endfunction

initial begin
    integer n;
    for (n = 1; n <= 100; n = n + 1)
        if (is_powerful(n)) $display("%0d", n);
end

endmodule
