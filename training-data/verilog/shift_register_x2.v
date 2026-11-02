module shreg_x2 #(parameter N = 8) (input clk, input din, output dout);
  reg [N-1:0] sr;
  always @(posedge clk) sr <= {sr[N-2:0], din};
  assign dout = sr[N-1];
endmodule
