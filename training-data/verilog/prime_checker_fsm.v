module prime_checker_fsm (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [7:0] n,
    output reg is_prime,
    output reg done
);

localparam IDLE = 2'd0, TEST = 2'd1, FINISH = 2'd2;
reg [1:0] state;
reg [7:0] divisor;
reg [7:0] value;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        is_prime <= 1'b0;
        done <= 1'b0;
        divisor <= 8'd2;
        value <= 8'd0;
    end else begin
        case (state)
            IDLE: begin
                done <= 1'b0;
                if (start) begin
                    value <= n;
                    divisor <= 8'd2;
                    is_prime <= (n >= 8'd2);
                    state <= (n < 8'd4) ? FINISH : TEST;
                end
            end
            TEST: begin
                if (value % divisor == 8'd0) begin
                    is_prime <= 1'b0;
                    state <= FINISH;
                end else if ((divisor + 8'd1) * (divisor + 8'd1) > value) begin
                    state <= FINISH;
                end else begin
                    divisor <= divisor + 1'b1;
                end
            end
            FINISH: begin
                done <= 1'b1;
                state <= IDLE;
            end
            default: state <= IDLE;
        endcase
    end
end

endmodule
