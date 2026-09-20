module non_restoring_divider_4bit (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [3:0] dividend,
    input wire [3:0] divisor,
    output reg [3:0] quotient,
    output reg [3:0] remainder,
    output reg done
);

localparam IDLE = 0, COMPUTE = 1, FINISH = 2;
reg [1:0] state;
reg [2:0] count;
reg signed [4:0] acc;
reg [3:0] q_reg;
reg [3:0] divisor_reg;
reg [8:0] shifted;
reg signed [4:0] a_shifted;
reg signed [4:0] new_a;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        done <= 1'b0;
        count <= 0;
    end else begin
        case (state)
            IDLE: begin
                done <= 1'b0;
                if (start) begin
                    acc <= 5'sd0;
                    q_reg <= dividend;
                    divisor_reg <= divisor;
                    count <= 3'd4;
                    state <= COMPUTE;
                end
            end
            COMPUTE: begin
                shifted = {acc, q_reg} << 1;
                a_shifted = shifted[8:4];
                if (a_shifted[4] == 1'b0) begin
                    new_a = a_shifted - {1'b0, divisor_reg};
                end else begin
                    new_a = a_shifted + {1'b0, divisor_reg};
                end
                acc <= new_a;
                q_reg <= {shifted[3:1], ~new_a[4]};
                if (count == 3'd1) begin
                    state <= FINISH;
                end
                count <= count - 3'd1;
            end
            FINISH: begin
                if (acc[4] == 1'b1) begin
                    remainder <= acc + divisor_reg;
                end else begin
                    remainder <= acc[3:0];
                end
                quotient <= q_reg;
                done <= 1'b1;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
