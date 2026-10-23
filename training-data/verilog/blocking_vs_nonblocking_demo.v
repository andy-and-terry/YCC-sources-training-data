module blocking_vs_nonblocking_demo (
    input  wire clk,
    input  wire d,
    output reg  q_nb2,
    output reg  q_b2
);

reg nb1;
reg b1;

// Non-blocking: both registers update at the clock edge (two flip-flops)
always @(posedge clk) begin
    nb1   <= d;
    q_nb2 <= nb1;
end

// Blocking: b1 updates immediately, so q_b2 sees the new value
// (collapses to a single flip-flop worth of delay)
always @(posedge clk) begin
    b1   = d;
    q_b2 = b1;
end

endmodule
