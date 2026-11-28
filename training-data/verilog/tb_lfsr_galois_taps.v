`timescale 1ns/1ps
module tb_lfsr_galois_taps;
    reg clk = 0, rst = 1;
    wire [15:0] q;
    lfsr_galois_taps dut (.clk(clk), .rst(rst), .q(q));
    always #5 clk = ~clk;
    initial begin
        #12 rst = 0;
        repeat (8) begin
            @(posedge clk);
            #1 $display("%h", q);
        end
        $finish;
    end
endmodule
