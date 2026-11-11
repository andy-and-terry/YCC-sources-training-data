// Perrin sequence P(n)=P(n-2)+P(n-3)
module PerrinSequence_tb;
    integer v [0:9];
    integer i;

    initial begin
        v[0] = 3; v[1] = 0; v[2] = 2;
        for (i = 3; i < 10; i = i + 1)
            v[i] = v[i - 2] + v[i - 3];
        for (i = 0; i < 10; i = i + 1)
            $write("%0d ", v[i]);
        $display("");
        $finish;
    end
endmodule
