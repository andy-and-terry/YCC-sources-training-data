`timescale 1ns/1ps

// Demonstrates fork/join, join_any style ordering with parallel delays.
module fork_join_testbench;
    reg a, b, c;
    integer finish_count;

    initial begin
        a = 0; b = 0; c = 0;
        finish_count = 0;

        fork
            begin
                #10 a = 1;
                $display("[%0t] a set", $time);
                finish_count = finish_count + 1;
            end
            begin
                #5 b = 1;
                $display("[%0t] b set", $time);
                finish_count = finish_count + 1;
            end
            begin
                #15 c = 1;
                $display("[%0t] c set", $time);
                finish_count = finish_count + 1;
            end
        join

        // Reached only after all three branches finish (time 15).
        $display("[%0t] all done, branches finished: %0d", $time, finish_count);
        $display("a=%b b=%b c=%b", a, b, c);
        $finish;
    end
endmodule
