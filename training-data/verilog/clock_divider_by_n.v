module clkdiv #(parameter N = 4) (input clk, rst, output reg out);
  reg [$clog2(N)-1:0] c;
  always @(posedge clk) begin
    if (rst) begin c <= 0; out <= 0; end
    else if (c == N/2 - 1) begin c <= 0; out <= ~out; end
    else c <= c + 1;
  end
endmodule
