module farey_sequence;
  parameter N = 5;
  integer a, b, c, d, k, e, f;
  initial begin
    a = 0; b = 1; c = 1; d = N;
    $write("%0d/%0d ", a, b);
    while (!(a == 1 && b == 1)) begin
      k = (N + b) / d;
      e = k * c - a;
      f = k * d - b;
      a = c; b = d; c = e; d = f;
      $write("%0d/%0d ", a, b);
    end
    $write("\n");
    $finish;
  end
endmodule
