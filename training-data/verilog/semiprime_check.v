module semiprime_check;
function integer prime_factor_count(input integer value);
    integer n, p;
    begin
        n = value;
        p = 2;
        prime_factor_count = 0;
        while (p * p <= n) begin
            while (n % p == 0) begin
                n = n / p;
                prime_factor_count = prime_factor_count + 1;
            end
            p = p + 1;
        end
        if (n > 1) prime_factor_count = prime_factor_count + 1;
    end
endfunction

initial begin
    integer n;
    for (n = 2; n < 30; n = n + 1)
        if (prime_factor_count(n) == 2) $display("%0d", n);
end

endmodule
