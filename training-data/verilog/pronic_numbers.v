// Generates successive pronic numbers n*(n+1): 0 2 6 12 20 30 ...
module pronic_numbers (
    input  wire        clk,
    input  wire        rst,
    output reg  [15:0] value
);

reg [7:0] n;

always @(posedge clk) begin
    if (rst) begin
        n     <= 8'd0;
        value <= 16'd0;
    end else begin
        n     <= n + 8'd1;
        value <= (n + 8'd1) * (n + 8'd2);
    end
end

endmodule
