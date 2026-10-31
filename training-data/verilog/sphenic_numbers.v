module sphenic_numbers;
function is_sphenic(input integer value);
    integer n, p, distinct;
    reg ok;
    begin
        n = value;
        p = 2;
        distinct = 0;
        ok = 1;
        while (p * p <= n && ok) begin
            if (n % p == 0) begin
                n = n / p;
                if (n % p == 0) ok = 0;
                else distinct = distinct + 1;
            end
            p = p + 1;
        end
        if (n > 1) distinct = distinct + 1;
        is_sphenic = ok && (distinct == 3);
    end
endfunction

initial begin
    integer n;
    for (n = 2; n < 80; n = n + 1)
        if (is_sphenic(n)) $display("%0d", n);
end

endmodule
