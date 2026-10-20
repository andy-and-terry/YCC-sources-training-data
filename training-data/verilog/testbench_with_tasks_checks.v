`timescale 1ns/1ps
module tb_adder;
    reg [3:0] a, b;
    wire [4:0] sum;
    integer errors = 0;
    assign sum = a + b;

    task check(input [3:0] x, input [3:0] y);
        begin
            a = x; b = y; #1;
            if (sum !== x + y) begin
                $display("FAIL %0d + %0d = %0d", x, y, sum);
                errors = errors + 1;
            end
        end
    endtask

    integer i, j;
    initial begin
        for (i = 0; i < 16; i = i + 1)
            for (j = 0; j < 16; j = j + 1)
                check(i[3:0], j[3:0]);
        if (errors == 0) $display("PASS"); else $display("%0d errors", errors);
        $finish;
    end
endmodule
