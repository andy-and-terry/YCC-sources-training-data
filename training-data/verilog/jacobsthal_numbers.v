// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
module jacobsthal_numbers;
  integer a, b, t, i;

  initial begin
    a = 0;
    b = 1;
    for (i = 0; i < 15; i = i + 1) begin
      $write("%0d ", a);
      t = b + 2 * a;
      a = b;
      b = t;
    end
    $write("\n");
    $finish;
  end
endmodule
