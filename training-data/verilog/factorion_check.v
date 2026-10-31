module factorion_check;
function integer digit_fact(input integer d);
    case (d)
        0, 1: digit_fact = 1;
        2: digit_fact = 2;
        3: digit_fact = 6;
        4: digit_fact = 24;
        5: digit_fact = 120;
        6: digit_fact = 720;
        7: digit_fact = 5040;
        8: digit_fact = 40320;
        default: digit_fact = 362880;
    endcase
endfunction

function is_factorion(input integer n);
    integer m, sum;
    begin
        m = n;
        sum = 0;
        while (m > 0) begin
            sum = sum + digit_fact(m % 10);
            m = m / 10;
        end
        is_factorion = (sum == n);
    end
endfunction

initial begin
    integer n;
    for (n = 1; n < 50000; n = n + 1)
        if (is_factorion(n)) $display("%0d", n);
end

endmodule
