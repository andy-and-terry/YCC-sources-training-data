module kolakoski_sequence;
  integer a [0:25];
  integer w, r, v, k, i;
  initial begin
    a[0] = 1; a[1] = 2; a[2] = 2;
    w = 3; r = 2; v = 1;
    while (w < 20) begin
      for (k = 0; k < a[r]; k = k + 1) begin
        a[w] = v;
        w = w + 1;
      end
      v = 3 - v;
      r = r + 1;
    end
    $write("%0d", a[0]);
    for (i = 1; i < 20; i = i + 1) $write(" %0d", a[i]);
    $write("\n");
    $finish;
  end
endmodule
