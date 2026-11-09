module counter #(parameter N = 10, W = 4) (input clk, input rst, output reg [W-1:0] count);
  always @(posedge clk) begin
    if (rst || count == N - 1) count <= 0;
    else count <= count + 1;
  end
endmodule
