module van_eck_sequence;
  integer t [0:19];
  integer i, j, next;
  initial begin
    t[0] = 0;
    $write("%0d", t[0]);
    for (i = 0; i < 19; i = i + 1) begin
      next = 0;
      for (j = i - 1; j >= 0; j = j - 1)
        if (next == 0 && t[j] == t[i]) next = i - j;
      t[i + 1] = next;
      $write(" %0d", next);
    end
    $write("\n");
    $finish;
  end
endmodule
