module aliquot_sequence;
  integer n, d, sum;
  initial begin
    n = 12;
    $write("%0d", n);
    while (n != 0) begin
      sum = 0;
      for (d = 1; d <= n / 2; d = d + 1)
        if (n % d == 0) sum = sum + d;
      n = sum;
      $write(" %0d", n);
    end
    $write("\n");
    $finish;
  end
endmodule
