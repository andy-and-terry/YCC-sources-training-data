module overlapping_sequence_detector_1101 (
    input wire clk,
    input wire rst_n,
    input wire x,
    output reg detected
);

localparam S0 = 2'd0, S1 = 2'd1, S11 = 2'd2, S110 = 2'd3;
reg [1:0] state, next_state;

always @(*) begin
    detected = 1'b0;
    case (state)
        S0:   next_state = x ? S1 : S0;
        S1:   next_state = x ? S11 : S0;
        S11:  next_state = x ? S11 : S110;
        S110: begin
            next_state = x ? S1 : S0;
            detected = x;
        end
        default: next_state = S0;
    endcase
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        state <= S0;
    else
        state <= next_state;
end

endmodule
