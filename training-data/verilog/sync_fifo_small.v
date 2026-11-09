module fifo #(parameter W = 8, D = 4) (input clk, rst, wr, rd, input [W-1:0] din,
                                       output [W-1:0] dout, output full, empty);
  reg [W-1:0] mem [0:D-1];
  reg [2:0] wp, rp;
  assign full  = (wp - rp) == D;
  assign empty = wp == rp;
  assign dout  = mem[rp[1:0]];
  always @(posedge clk) begin
    if (rst) begin wp <= 0; rp <= 0; end
    else begin
      if (wr && !full) begin mem[wp[1:0]] <= din; wp <= wp + 1; end
      if (rd && !empty) rp <= rp + 1;
    end
  end
endmodule
