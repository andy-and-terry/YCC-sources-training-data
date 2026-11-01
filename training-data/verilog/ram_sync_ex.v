module ram_sync_ex #(parameter AW = 4, DW = 8) (
  input clk, we,
  input [AW-1:0] addr,
  input [DW-1:0] din,
  output reg [DW-1:0] dout
);
  reg [DW-1:0] mem [0:(1<<AW)-1];
  always @(posedge clk) begin
    if (we) mem[addr] <= din;
    dout <= mem[addr];
  end
endmodule
