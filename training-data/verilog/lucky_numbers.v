module lucky_numbers;
  integer l [0:63];
  integer len, idx, step, kept, i, k;
  initial begin
    for (i = 0; i < 50; i = i + 1) l[i] = 2 * i + 1;
    len = 50;
    idx = 1;
    while (idx < len && l[idx] <= len) begin
      step = l[idx];
      kept = 0;
      for (k = 0; k < len; k = k + 1)
        if (((k + 1) % step) != 0) begin
          l[kept] = l[k];
          kept = kept + 1;
        end
      len = kept;
      idx = idx + 1;
    end
    $write("%0d", l[0]);
    for (i = 1; i < len; i = i + 1) $write(" %0d", l[i]);
    $write("\n");
    $finish;
  end
endmodule
