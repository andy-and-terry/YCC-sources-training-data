module kolakoski_sequence;
  integer s [0:31];
  integer len, i, j, value;
  initial begin
    s[0] = 1;
    s[1] = 2;
    s[2] = 2;
    len = 3;
    i = 2;
    while (len < 20) begin
      value = 3 - s[len - 1];
      for (j = 0; j < s[i]; j = j + 1) begin
        s[len] = value;
        len = len + 1;
      end
      i = i + 1;
    end
    $write("%0d", s[0]);
    for (i = 1; i < 20; i = i + 1) $write(" %0d", s[i]);
    $write("\n");
    $finish;
  end
endmodule
