module negedge_register #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

always @(negedge clk) begin
    q <= d;
end

endmodule
