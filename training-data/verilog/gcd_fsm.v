module gcd_fsm (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [7:0] a_in,
    input wire [7:0] b_in,
    output reg [7:0] result,
    output reg done
);

localparam IDLE = 2'd0, RUN = 2'd1, FINISH = 2'd2;

reg [1:0] state;
reg [7:0] a, b;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        a <= 8'd0;
        b <= 8'd0;
        result <= 8'd0;
        done <= 1'b0;
    end else begin
        case (state)
            IDLE: begin
                done <= 1'b0;
                if (start) begin
                    a <= a_in;
                    b <= b_in;
                    state <= RUN;
                end
            end
            RUN: begin
                // Subtractive Euclid
                if (b == 0) state <= FINISH;
                else if (a >= b) a <= a - b;
                else begin
                    a <= b;
                    b <= a;
                end
            end
            FINISH: begin
                result <= a;
                done <= 1'b1;
                state <= IDLE;
            end
            default: state <= IDLE;
        endcase
    end
end

endmodule
