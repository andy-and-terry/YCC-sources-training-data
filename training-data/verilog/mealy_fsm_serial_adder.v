module mealy_fsm_serial_adder (
    input  wire clk,
    input  wire rst_n,
    input  wire a_bit,
    input  wire b_bit,
    output reg  sum_bit
);

localparam NO_CARRY = 1'b0, CARRY = 1'b1;
reg state;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= NO_CARRY;
    end else begin
        case (state)
            NO_CARRY: state <= (a_bit & b_bit) ? CARRY : NO_CARRY;
            CARRY:    state <= (a_bit | b_bit) ? CARRY : NO_CARRY;
        endcase
    end
end

always @(*) begin
    case (state)
        NO_CARRY: sum_bit = a_bit ^ b_bit;
        CARRY:    sum_bit = a_bit ^ b_bit ^ 1'b1;
        default:  sum_bit = 1'b0;
    endcase
end

endmodule
