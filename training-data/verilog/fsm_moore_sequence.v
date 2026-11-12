module seq101(input clk, rst, x, output z);
  reg [1:0] s;
  always @(posedge clk) begin
    if (rst) s <= 0;
    else case (s)
      0: s <= x ? 1 : 0;
      1: s <= x ? 1 : 2;
      2: s <= x ? 3 : 0;
      3: s <= x ? 1 : 2;
    endcase
  end
  assign z = (s == 3);
endmodule
