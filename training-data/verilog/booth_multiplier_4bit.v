module booth_multiplier_4bit (
    input  wire              clk,
    input  wire              rst_n,
    input  wire              start,
    input  wire signed [3:0] multiplicand,
    input  wire signed [3:0] multiplier,
    output reg  signed [7:0] product,
    output reg               done
);

localparam IDLE = 2'd0, COMPUTE = 2'd1, FINISH = 2'd2;

reg [1:0] state;
reg [2:0] count;
reg signed [4:0] a_reg;
reg signed [3:0] q_reg, m_reg;
reg q_minus1;
reg [9:0] shifted;

// a_reg is one bit wider than the operands (5 bits for 4-bit inputs) so
// that an intermediate add/subtract can never overflow, even for the
// edge case multiplicand = -8 (the most negative 4-bit two's complement
// value), whose magnitude alone does not fit back into 4 bits.
wire signed [4:0] alu_result = (q_reg[0] & ~q_minus1) ? (a_reg - m_reg) :
                                (~q_reg[0] & q_minus1) ? (a_reg + m_reg) :
                                a_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        done  <= 1'b0;
        count <= 3'd0;
    end else begin
        case (state)
            IDLE: begin
                done <= 1'b0;
                if (start) begin
                    a_reg    <= 5'sd0;
                    q_reg    <= multiplier;
                    q_minus1 <= 1'b0;
                    m_reg    <= multiplicand;
                    count    <= 3'd4;
                    state    <= COMPUTE;
                end
            end
            COMPUTE: begin
                shifted  = $signed({alu_result, q_reg, q_minus1}) >>> 1;
                a_reg    <= shifted[9:5];
                q_reg    <= shifted[4:1];
                q_minus1 <= shifted[0];
                if (count == 3'd1) begin
                    state <= FINISH;
                end
                count <= count - 3'd1;
            end
            FINISH: begin
                product <= {a_reg[3:0], q_reg};
                done    <= 1'b1;
                state   <= IDLE;
            end
        endcase
    end
end

endmodule
