module booth_multiplier_4bit (
    input wire signed [3:0] multiplicand,
    input wire signed [3:0] multiplier,
    output reg signed [7:0] product
);

integer i;
reg signed [8:0] acc_q_q1;
reg signed [3:0] m_reg;

always @(*) begin
    m_reg = multiplicand;
    acc_q_q1 = {4'b0000, multiplier, 1'b0};
    for (i = 0; i < 4; i = i + 1) begin
        case (acc_q_q1[1:0])
            2'b01: acc_q_q1[8:5] = acc_q_q1[8:5] + m_reg;
            2'b10: acc_q_q1[8:5] = acc_q_q1[8:5] - m_reg;
            default: acc_q_q1[8:5] = acc_q_q1[8:5];
        endcase
        acc_q_q1 = {acc_q_q1[8], acc_q_q1[8:1]};
    end
    product = acc_q_q1[8:1];
end

endmodule
