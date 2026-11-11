// Lazy caterer sequence: max pieces from n cuts
module LazyCaterer_tb;
    integer n;

    function integer term(input integer n);
        term = ((n * (n + 1))/2) + 1;
    endfunction

    initial begin
        for (n = 0; n < 10; n = n + 1)
            $write("%0d ", term(n));
        $display("");
        $finish;
    end
endmodule
