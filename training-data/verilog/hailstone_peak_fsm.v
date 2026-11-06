// Collatz (hailstone) FSM that tracks the highest value reached
module hailstone_peak_fsm (
    input  wire        clk,
    input  wire        rst,
    input  wire        start,
    input  wire [31:0] n_in,
    output reg  [31:0] peak,
    output reg         done
);

reg [31:0] n;
reg        running;

always @(posedge clk) begin
    if (rst) begin
        running <= 1'b0;
        done    <= 1'b0;
        peak    <= 32'd0;
        n       <= 32'd0;
    end else if (start && !running) begin
        n       <= n_in;
        peak    <= n_in;
        running <= 1'b1;
        done    <= 1'b0;
    end else if (running) begin
        if (n == 32'd1) begin
            running <= 1'b0;
            done    <= 1'b1;
        end else begin
            n <= n[0] ? (3 * n + 1) : (n >> 1);
            if ((n[0] ? (3 * n + 1) : (n >> 1)) > peak)
                peak <= n[0] ? (3 * n + 1) : (n >> 1);
        end
    end
end

endmodule
