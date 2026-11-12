module parity(input [7:0] d, output even, odd);
  assign odd = ^d;
  assign even = ~^d;
endmodule
