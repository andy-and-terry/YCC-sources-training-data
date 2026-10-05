module parameterized_delay_line #(
    parameter WIDTH = 8,
    parameter DELAY = 4
) (
    input wire clk,
    input wire en,
    input wire [WIDTH-1:0] din,
    output wire [WIDTH-1:0] dout
);

reg [WIDTH-1:0] pipe [0:DELAY-1];
integer i;

always @(posedge clk) begin
    if (en) begin
        pipe[0] <= din;
        for (i = 1; i < DELAY; i = i + 1)
            pipe[i] <= pipe[i-1];
    end
end

assign dout = pipe[DELAY-1];

endmodule
