module tb;
  reg clk = 0;
  always #5 clk = ~clk;
  initial begin
    #30 $display("t=%0t clk=%b", $time, clk);
    $finish;
  end
endmodule
