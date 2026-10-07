module fibonacci_generator (
    input wire clk,
    input wire rst_n,
    input wire next,
    output wire [15:0] fib
);

reg [15:0] prev, curr;

assign fib = curr;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        prev <= 16'd1;
        curr <= 16'd0;
    end else if (next) begin
        curr <= curr + prev;
        prev <= curr;
    end
end

endmodule
