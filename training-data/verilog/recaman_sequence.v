module recaman_sequence;
  reg seen [0:255];
  integer i, prev, next;
  initial begin
    for (i = 0; i < 256; i = i + 1) seen[i] = 1'b0;
    prev = 0;
    seen[0] = 1'b1;
    $write("%0d", prev);
    for (i = 1; i < 20; i = i + 1) begin
      next = prev - i;
      if (next <= 0 || seen[next])
        next = prev + i;
      seen[next] = 1'b1;
      prev = next;
      $write(" %0d", next);
    end
    $write("\n");
    $finish;
  end
endmodule
