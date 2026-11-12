module dec(input [2:0] a, output [7:0] y);
  genvar i;
  generate for (i = 0; i < 8; i = i + 1) begin : g
    assign y[i] = (a == i);
  end endgenerate
endmodule
