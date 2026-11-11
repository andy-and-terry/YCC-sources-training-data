// Pronic numbers n(n+1)
module PronicNumbers_tb;
    integer n;

    function integer term(input integer n);
        term = n * (n + 1);
    endfunction

    initial begin
        for (n = 0; n < 10; n = n + 1)
            $write("%0d ", term(n));
        $display("");
        $finish;
    end
endmodule
