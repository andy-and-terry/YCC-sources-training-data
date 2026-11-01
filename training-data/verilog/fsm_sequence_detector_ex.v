// detects 101 (overlapping)
module fsm_sequence_detector_ex (input clk, rst, x, output z);
  localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2;
  reg [1:0] state, next;
  always @(posedge clk or posedge rst)
    if (rst) state <= S0; else state <= next;
  always @(*) begin
    case (state)
      S0: next = x ? S1 : S0;
      S1: next = x ? S1 : S2;
      S2: next = x ? S1 : S0;
      default: next = S0;
    endcase
  end
  assign z = (state == S2) && x;
endmodule
