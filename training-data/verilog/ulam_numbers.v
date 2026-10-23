module ulam_numbers;
  integer u [0:14];
  integer len, candidate, ways, i, j;
  initial begin
    u[0] = 1;
    u[1] = 2;
    len = 2;
    candidate = 3;
    while (len < 15) begin
      ways = 0;
      for (i = 0; i < len; i = i + 1)
        for (j = i + 1; j < len; j = j + 1)
          if (u[i] + u[j] == candidate) ways = ways + 1;
      if (ways == 1) begin
        u[len] = candidate;
        len = len + 1;
      end
      candidate = candidate + 1;
    end
    $write("%0d", u[0]);
    for (i = 1; i < 15; i = i + 1) $write(" %0d", u[i]);
    $write("\n");
    $finish;
  end
endmodule
