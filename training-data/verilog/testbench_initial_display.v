module tb;
  reg a, b; wire y;
  assign y = a & b;
  initial begin
    $monitor("%b %b -> %b", a, b, y);
    a = 0; b = 0; #1 a = 1; #1 b = 1; #1 $finish;
  end
endmodule
