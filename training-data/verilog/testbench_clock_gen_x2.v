module tb_x2;
  reg clk = 0;
  always #5 clk = ~clk;
  initial begin
    #50 $display("t=%0t", $time);
    $finish;
  end
endmodule
