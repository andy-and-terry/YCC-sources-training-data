// Tetrahedral numbers n(n+1)(n+2)/6
module TetrahedralNumbers_tb;
    integer n;

    function integer term(input integer n);
        term = ((n * (n + 1)) * (n + 2))/6;
    endfunction

    initial begin
        for (n = 0; n < 10; n = n + 1)
            $write("%0d ", term(n));
        $display("");
        $finish;
    end
endmodule
