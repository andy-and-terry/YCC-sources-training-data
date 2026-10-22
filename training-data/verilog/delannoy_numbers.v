module delannoy_numbers;
  integer d [0:99];
  integer m, n;
  initial begin
    for (m = 0; m < 10; m = m + 1)
      for (n = 0; n < 10; n = n + 1)
        if (m == 0 || n == 0)
          d[m * 10 + n] = 1;
        else
          d[m * 10 + n] = d[(m - 1) * 10 + n] + d[m * 10 + n - 1] + d[(m - 1) * 10 + n - 1];
    $write("%0d", d[0]);
    for (m = 1; m < 10; m = m + 1) $write(" %0d", d[m * 11]);
    $write("\n");
    $finish;
  end
endmodule
