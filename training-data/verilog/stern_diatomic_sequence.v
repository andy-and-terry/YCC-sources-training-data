module stern_diatomic_sequence;
  integer s [0:19];
  integer n;
  initial begin
    s[0] = 0;
    s[1] = 1;
    for (n = 2; n < 20; n = n + 1) begin
      if (n % 2 == 0) s[n] = s[n / 2];
      else s[n] = s[n / 2] + s[n / 2 + 1];
    end
    $write("%0d", s[0]);
    for (n = 1; n < 20; n = n + 1) $write(" %0d", s[n]);
    $write("\n");
    $finish;
  end
endmodule
