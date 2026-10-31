module cullen_numbers;
function [31:0] cullen(input [31:0] n);
    cullen = n * (32'd1 << n) + 1;
endfunction

initial begin
    integer n;
    for (n = 1; n <= 5; n = n + 1)
        $display("%0d %0d", n, cullen(n));
end

endmodule
