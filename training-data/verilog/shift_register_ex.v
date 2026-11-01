module shift_register_ex (input clk, input rst, input din, output reg [7:0] q);
  always @(posedge clk or posedge rst) begin
    if (rst) q <= 8'b0;
    else q <= {q[6:0], din};
  end
endmodule
