module golomb_sequence;
  integer g [1:20];
  integer n;
  initial begin
    g[1] = 1;
    for (n = 2; n <= 20; n = n + 1)
      g[n] = 1 + g[n - g[g[n - 1]]];
    for (n = 1; n <= 20; n = n + 1)
      $write("%0d ", g[n]);
    $write("\n");
    $finish;
  end
endmodule
