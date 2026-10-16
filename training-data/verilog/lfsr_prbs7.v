module lfsr_prbs7 (
    input wire clk,
    input wire rst_n,
    input wire en,
    output wire prbs_out,
    output reg [6:0] state
);

// x^7 + x^6 + 1 polynomial, period 127
wire feedback = state[6] ^ state[5];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        state <= 7'h7F;
    else if (en)
        state <= {state[5:0], feedback};
end

assign prbs_out = state[6];

endmodule
