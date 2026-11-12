module shreg(input clk, input din, output reg [3:0] q);
  always @(posedge clk) q <= {q[2:0], din};
endmodule
