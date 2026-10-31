module alternating_digit_sum;
function integer alternating_digit_sum(input integer value);
    integer n, sign;
    begin
        n = value;
        sign = 1;
        alternating_digit_sum = 0;
        while (n > 0) begin
            alternating_digit_sum = alternating_digit_sum + sign * (n % 10);
            sign = -sign;
            n = n / 10;
        end
    end
endfunction

initial begin
    $display("1234 %0d", alternating_digit_sum(1234));
    $display("99999 %0d", alternating_digit_sum(99999));
    $display("1000 %0d", alternating_digit_sum(1000));
end

endmodule
