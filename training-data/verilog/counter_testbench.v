module counter_testbench;

reg clk;
reg reset;
wire [7:0] count;

counter dut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
    reset = 1'b1;
    #12 reset = 1'b0;
    repeat (5) @(posedge clk);
    #1 if (count !== 8'd5)
        $display("FAIL: expected 5, got %d", count);
    else
        $display("PASS: count = %d", count);
    $finish;
end

endmodule
