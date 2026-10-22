module polygonal_numbers;
  function integer polygonal(input integer s, input integer n);
    begin
      polygonal = ((s - 2) * n * n - (s - 4) * n) / 2;
    end
  endfunction

  integer n;
  initial begin
    $write("triangular:");
    for (n = 1; n <= 10; n = n + 1) $write(" %0d", polygonal(3, n));
    $write("\npentagonal:");
    for (n = 1; n <= 10; n = n + 1) $write(" %0d", polygonal(5, n));
    $write("\nhexagonal:");
    for (n = 1; n <= 10; n = n + 1) $write(" %0d", polygonal(6, n));
    $write("\n");
    $finish;
  end
endmodule
