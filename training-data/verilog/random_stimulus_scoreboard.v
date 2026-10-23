`timescale 1ns/1ps

module adder8 (
    input  [7:0] a,
    input  [7:0] b,
    output [8:0] sum
);
    assign sum = a + b;
endmodule

// Random-stimulus testbench with a simple reference-model scoreboard.
module random_stimulus_scoreboard;
    reg  [7:0] a, b;
    wire [8:0] sum;
    integer i, errors, seed;
    reg [8:0] expected;

    adder8 dut (.a(a), .b(b), .sum(sum));

    initial begin
        errors = 0;
        seed = 32'hC0FFEE;
        for (i = 0; i < 100; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            #1;
            expected = {1'b0, a} + {1'b0, b};
            if (sum !== expected) begin
                errors = errors + 1;
                $display("MISMATCH a=%0d b=%0d sum=%0d expected=%0d", a, b, sum, expected);
            end
        end
        // Corner cases
        a = 8'hFF; b = 8'hFF; #1;
        if (sum !== 9'd510) errors = errors + 1;

        if (errors == 0) $display("PASS: 101 vectors checked");
        else             $display("FAIL: %0d errors", errors);
        $finish;
    end
endmodule
