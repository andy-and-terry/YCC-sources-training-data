module edge_det(input clk, sig, output pulse);
  reg d;
  always @(posedge clk) d <= sig;
  assign pulse = sig & ~d;
endmodule
