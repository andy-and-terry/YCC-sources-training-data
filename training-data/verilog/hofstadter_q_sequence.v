module hofstadter_q_sequence;
  integer q [1:20];
  integer n;
  initial begin
    q[1] = 1;
    q[2] = 1;
    for (n = 3; n <= 20; n = n + 1)
      q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
    for (n = 1; n <= 20; n = n + 1)
      $write("%0d ", q[n]);
    $write("\n");
    $finish;
  end
endmodule
