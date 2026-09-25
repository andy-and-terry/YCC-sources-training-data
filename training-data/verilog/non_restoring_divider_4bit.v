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

localparam IDLE = 0, COMPUTE = 1, CORRECT = 2, FINISH = 3;
reg [1:0] state;
reg [2:0] bit_count;
reg [4:0] acc;
reg [3:0] quot;
reg [3:0] divisor_reg;

wire [4:0] shifted   = {acc[3:0], quot[3]};
wire [4:0] div_ext   = {1'b0, divisor_reg};
wire [4:0] next_acc  = acc[4] ? (shifted + div_ext) : (shifted - div_ext);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        done <= 1'b0;
        bit_count <= 0;
    end else begin
        case (state)
            IDLE: begin
                done <= 1'b0;
                if (start) begin
                    acc <= 5'd0;
                    quot <= dividend;
                    divisor_reg <= divisor;
                    bit_count <= 0;
                    state <= COMPUTE;
                end
            end
            COMPUTE: begin
                acc <= next_acc;
                quot <= {quot[2:0], ~next_acc[4]};
                if (bit_count == 3'd3) begin
                    state <= next_acc[4] ? CORRECT : FINISH;
                end else begin
                    bit_count <= bit_count + 1'b1;
                end
            end
            CORRECT: begin
                acc <= acc + div_ext;
                state <= FINISH;
            end
            FINISH: begin
                quotient <= quot;
                remainder <= acc[3:0];
                done <= 1'b1;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
