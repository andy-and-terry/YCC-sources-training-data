module ram(input clk, we, input [3:0] a, input [7:0] din, output [7:0] dout);
  reg [7:0] mem [0:15];
  always @(posedge clk) if (we) mem[a] <= din;
  assign dout = mem[a];
endmodule
