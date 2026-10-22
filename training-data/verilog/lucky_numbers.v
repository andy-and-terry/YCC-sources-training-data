module lucky_numbers;
  integer nums [0:31];
  integer len, idx, step, kept, n, j;
  initial begin
    len = 0;
    for (n = 1; n <= 50; n = n + 2) begin
      nums[len] = n;
      len = len + 1;
    end
    idx = 1;
    while (idx < len && nums[idx] <= len) begin
      step = nums[idx];
      kept = 0;
      for (j = 0; j < len; j = j + 1) begin
        if ((j + 1) % step != 0) begin
          nums[kept] = nums[j];
          kept = kept + 1;
        end
      end
      len = kept;
      idx = idx + 1;
    end
    $write("%0d", nums[0]);
    for (j = 1; j < len; j = j + 1) $write(" %0d", nums[j]);
    $write("\n");
    $finish;
  end
endmodule
