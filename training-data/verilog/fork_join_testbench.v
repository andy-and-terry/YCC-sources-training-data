`timescale 1ns/1ps

module fork_join_testbench;

reg a;
reg b;
integer done_count;

initial begin
    a = 0;
    b = 0;
    done_count = 0;

    // Branches start together; join waits for all of them
    fork
        begin
            #10 a = 1;
            done_count = done_count + 1;
        end
        begin
            #25 b = 1;
            done_count = done_count + 1;
        end
        begin
            #5 $display("t=%0t: third branch ran", $time);
            done_count = done_count + 1;
        end
    join

    $display("t=%0t: all branches joined, a=%b b=%b count=%0d", $time, a, b, done_count);
    $finish;
end

endmodule
