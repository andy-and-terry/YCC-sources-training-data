module programmable_clock_divider (
    input  wire        clk_in,
    input  wire        rst_n,
    input  wire [15:0] divisor,
    output reg         clk_out
);

reg [15:0] count;

always @(posedge clk_in or negedge rst_n) begin
    if (!rst_n) begin
        count   <= 16'd0;
        clk_out <= 1'b0;
    end else if (divisor <= 16'd1) begin
        clk_out <= clk_in;
        count   <= 16'd0;
    end else if (count >= (divisor - 1'b1)) begin
        count   <= 16'd0;
        clk_out <= ~clk_out;
    end else begin
        count <= count + 1'b1;
    end
end

endmodule
