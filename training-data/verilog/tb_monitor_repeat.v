`timescale 1ns/1ps

module tb_monitor_repeat;

reg clk = 0;
reg [3:0] count = 0;

always #5 clk = ~clk;

always @(posedge clk)
    count <= count + 1;

initial begin
    $monitor("t=%0t clk=%b count=%d", $time, clk, count);
    repeat (6) @(posedge clk);
    wait (count == 6);
    $display("count reached %d", count);
    $finish;
end

endmodule
