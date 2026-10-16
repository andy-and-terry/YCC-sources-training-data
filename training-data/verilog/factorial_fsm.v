module factorial_fsm (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [3:0] n,
    output reg [31:0] result,
    output reg done
);

reg [3:0] counter;
reg running;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        result <= 32'd1;
        counter <= 4'd0;
        running <= 1'b0;
        done <= 1'b0;
    end else if (start && !running) begin
        result <= 32'd1;
        counter <= n;
        running <= 1'b1;
        done <= 1'b0;
    end else if (running) begin
        if (counter <= 4'd1) begin
            running <= 1'b0;
            done <= 1'b1;
        end else begin
            result <= result * counter;
            counter <= counter - 1'b1;
        end
    end
end

endmodule
