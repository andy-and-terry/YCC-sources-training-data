module ulam_numbers;
  integer terms [0:14];
  integer len, c, ways, i, j;
  initial begin
    terms[0] = 1;
    terms[1] = 2;
    len = 2;
    c = 3;
    while (len < 15) begin
      ways = 0;
      for (i = 0; i < len; i = i + 1)
        for (j = i + 1; j < len; j = j + 1)
          if (terms[i] + terms[j] == c) ways = ways + 1;
      if (ways == 1) begin
        terms[len] = c;
        len = len + 1;
      end
      c = c + 1;
    end
    $write("%0d", terms[0]);
    for (i = 1; i < 15; i = i + 1) $write(" %0d", terms[i]);
    $write("\n");
    $finish;
  end
endmodule
