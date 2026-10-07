module decade_counter (
    input wire clk,
    input wire rst_n,
    input wire enable,
    output reg [3:0] count,
    output wire carry_out
);

assign carry_out = (count == 4'd9) && enable;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 4'd0;
    end else if (enable) begin
        if (count == 4'd9)
            count <= 4'd0;
        else
            count <= count + 1'b1;
    end
end

endmodule
