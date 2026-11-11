// Narayana's cows N(n)=N(n-1)+N(n-3)
module NarayanaCows_tb;
    integer v [0:9];
    integer i;

    initial begin
        v[0] = 1; v[1] = 1; v[2] = 1;
        for (i = 3; i < 10; i = i + 1)
            v[i] = v[i - 1] + v[i - 3];
        for (i = 0; i < 10; i = i + 1)
            $write("%0d ", v[i]);
        $display("");
        $finish;
    end
endmodule
