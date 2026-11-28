module tb;
    reg clk = 0;
    always #5 clk = ~clk;
    initial begin
        $display("start");
        #50 $display("t=%0t", $time);
        $finish;
    end
endmodule
