// Centered square numbers 2n(n+1)+1
module CenteredSquareNumbers_tb;
    integer n;

    function integer term(input integer n);
        term = ((2 * n) * (n + 1)) + 1;
    endfunction

    initial begin
        for (n = 0; n < 10; n = n + 1)
            $write("%0d ", term(n));
        $display("");
        $finish;
    end
endmodule
