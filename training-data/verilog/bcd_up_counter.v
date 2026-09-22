module bcd_up_counter (
    input wire clk,
    input wire rst_n,
    input wire en,
    output reg [3:0] bcd,
    output wire carry_out
);

assign carry_out = (bcd == 4'd9) && en;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bcd <= 4'd0;
    end else if (en) begin
        if (bcd == 4'd9) begin
            bcd <= 4'd0;
        end else begin
            bcd <= bcd + 4'd1;
        end
    end
end

endmodule
