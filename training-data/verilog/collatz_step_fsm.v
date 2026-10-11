module collatz_step_fsm (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [15:0] n_in,
    output reg [15:0] steps,
    output reg busy,
    output reg done
);

reg [31:0] n;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        n <= 32'd0;
        steps <= 16'd0;
        busy <= 1'b0;
        done <= 1'b0;
    end else if (start && !busy) begin
        n <= {16'd0, n_in};
        steps <= 16'd0;
        busy <= 1'b1;
        done <= 1'b0;
    end else if (busy) begin
        if (n <= 32'd1) begin
            busy <= 1'b0;
            done <= 1'b1;
        end else begin
            n <= n[0] ? (n * 3 + 1) : (n >> 1);
            steps <= steps + 1'b1;
        end
    end
end

endmodule
