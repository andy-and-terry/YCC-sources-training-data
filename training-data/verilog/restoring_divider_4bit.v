module restoring_divider_4bit (
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
reg [2:0] bit_count;
reg [7:0] work_reg;
reg [3:0] divisor_reg;
wire [4:0] sub_result;

assign sub_result = {1'b0, work_reg[6:3]} - {1'b0, divisor_reg};

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
                    work_reg <= {4'b0, dividend};
                    divisor_reg <= divisor;
                    bit_count <= 0;
                    state <= COMPUTE;
                end
            end
            COMPUTE: begin
                if (!sub_result[4]) begin
                    work_reg <= {sub_result[3:0], work_reg[2:0], 1'b1};
                end else begin
                    work_reg <= {work_reg[6:0], 1'b0};
                end
                if (bit_count == 3'd3) begin
                    state <= FINISH;
                end else begin
                    bit_count <= bit_count + 1;
                end
            end
            FINISH: begin
                quotient <= work_reg[3:0];
                remainder <= work_reg[7:4];
                done <= 1'b1;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
