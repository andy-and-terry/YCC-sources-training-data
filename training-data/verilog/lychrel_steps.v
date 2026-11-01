// Reverse-and-add until a palindrome; count the steps.
module lychrel_steps;
    function [63:0] reverse_digits(input [63:0] v);
        reg [63:0] m;
        begin
            m = v;
            reverse_digits = 0;
            while (m > 0) begin
                reverse_digits = reverse_digits * 10 + (m % 10);
                m = m / 10;
            end
        end
    endfunction

    function integer steps(input [63:0] start);
        reg [63:0] n;
        integer count;
        begin
            n = start;
            steps = -1;
            for (count = 0; count < 50 && steps < 0; count = count + 1) begin
                if (count > 0 && n == reverse_digits(n)) steps = count;
                else n = n + reverse_digits(n);
            end
        end
    endfunction

    initial begin
        $display("%0d %0d %0d %0d %0d", steps(56), steps(57), steps(59), steps(79), steps(89));
        $finish;
    end
endmodule
