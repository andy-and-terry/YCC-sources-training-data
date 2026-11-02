module updown_x2 (input clk, input rst, input up, output reg [3:0] cnt);
  always @(posedge clk)
    if (rst) cnt <= 0;
    else if (up) cnt <= cnt + 1;
    else cnt <= cnt - 1;
endmodule
