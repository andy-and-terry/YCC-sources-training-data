// Square of the sum minus sum of squares for 1..10 (expect 2640)
module SumSquareDifference_tb;
    integer i, total, squares;

    initial begin
        total = 0;
        squares = 0;
        for (i = 1; i <= 10; i = i + 1) begin
            total = total + i;
            squares = squares + i * i;
        end
        $display("%0d", total * total - squares);
        $finish;
    end
endmodule
