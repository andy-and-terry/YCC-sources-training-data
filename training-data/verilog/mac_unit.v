module mac_unit (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire en,
    input wire signed [7:0] a,
    input wire signed [7:0] b,
    output reg signed [23:0] acc
);

// Multiply-accumulate: acc += a * b
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        acc <= 24'sd0;
    else if (clear)
        acc <= 24'sd0;
    else if (en)
        acc <= acc + a * b;
end

endmodule
