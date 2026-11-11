// Plus-one on a two-digit BCD value (00..99). 99 wraps to 00 and raises overflow.
module bcd_incrementer_2digit (
    input wire [7:0] bcd_in,
    output reg [7:0] bcd_out,
    output reg overflow
);

always @(*) begin
    overflow = 1'b0;
    if (bcd_in[3:0] < 4'd9) begin
        bcd_out = {bcd_in[7:4], bcd_in[3:0] + 4'd1};
    end else if (bcd_in[7:4] < 4'd9) begin
        bcd_out = {bcd_in[7:4] + 4'd1, 4'd0};
    end else begin
        bcd_out = 8'h00;
        overflow = 1'b1;
    end
end

endmodule
