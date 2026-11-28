module rail_fence_index #(
    parameter RAILS = 3
) (
    input  wire [7:0] i,
    output reg  [3:0] rail
);

localparam PERIOD = 2 * (RAILS - 1);
wire [7:0] m = i % PERIOD;

always @* begin
    if (m < RAILS) rail = m[3:0];
    else           rail = PERIOD - m[3:0];
end

endmodule
