module bin2gray #(parameter N = 4) (input [N-1:0] b, output [N-1:0] g);
  assign g = b ^ (b >> 1);
endmodule
