module clock_enable_divide_by3 (
    input wire clk,
    input wire rst_n,
    output reg en_div3
);

reg [1:0] cnt;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 2'd0;
        en_div3 <= 1'b0;
    end else if (cnt == 2'd2) begin
        cnt <= 2'd0;
        en_div3 <= 1'b1;
    end else begin
        cnt <= cnt + 1'b1;
        en_div3 <= 1'b0;
    end
end

endmodule
