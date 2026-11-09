`timescale 1ns/1ps
module tb;
  reg clk = 0, rst = 1;
  wire [3:0] c;
  counter #(.N(10), .W(4)) dut (.clk(clk), .rst(rst), .count(c));
  always #5 clk = ~clk;
  initial begin
    #12 rst = 0;
    #100 $display("count=%d", c);
    $finish;
  end
endmodule
