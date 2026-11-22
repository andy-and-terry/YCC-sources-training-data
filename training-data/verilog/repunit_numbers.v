// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
module repunit_numbers;
    reg [63:0] r;
    integer i;
    initial begin
        r = 0;
        for (i = 0; i < 8; i = i + 1) begin
            r = r * 10 + 1;
            $write("%0d ", r);
        end
        $write("\n");
        $finish;
    end
endmodule
