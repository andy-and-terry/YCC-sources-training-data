// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
module tribonacci_numbers;
    reg [31:0] a, b, c, next;
    integer i;

    initial begin
        a = 0; b = 0; c = 1;
        $write("Tribonacci:");
        for (i = 0; i < 15; i = i + 1) begin
            $write(" %0d", a);
            next = a + b + c;
            a = b;
            b = c;
            c = next;
        end
        $write("\n");
        $finish;
    end
endmodule
