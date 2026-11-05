`timescale 1ns/1ps
module tb;
    reg clk = 0;
    reg [3:0] n = 0;
    always #5 clk = ~clk;
    always @(posedge clk) n <= n + 1;
    initial begin
        #100;
        $display("n=%d at %0t", n, $time);
        $finish;
    end
endmodule
