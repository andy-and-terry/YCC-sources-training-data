`timescale 1ns/1ps
module tb_clock_gen_ex;
  reg clk = 0;
  always #5 clk = ~clk;
  integer cycles = 0;
  always @(posedge clk) begin
    cycles = cycles + 1;
    if (cycles == 5) begin
      $display("cycles=%0d time=%0t", cycles, $time);
      $finish;
    end
  end
endmodule
