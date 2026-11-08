module delta_encoder #(parameter W = 8) (
    input wire clk,
    input wire rst,
    input wire [W-1:0] x,
    output reg [W-1:0] delta
);
    reg [W-1:0] prev;
    always @(posedge clk or posedge rst) begin
        if (rst) begin prev <= 0; delta <= 0; end
        else begin delta <= x - prev; prev <= x; end
    end
endmodule
