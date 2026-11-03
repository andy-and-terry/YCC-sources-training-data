module triangular_numbers (
    input        clk,
    input        rst,
    output reg [15:0] tri
);
    reg [7:0] n;
    always @(posedge clk) begin
        if (rst) begin
            n   <= 8'd0;
            tri <= 16'd0;
        end else begin
            n   <= n + 8'd1;
            tri <= tri + n + 8'd1;
        end
    end
endmodule
