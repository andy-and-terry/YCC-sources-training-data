module modulo_n_counter #(
    parameter WIDTH = 4,
    parameter MOD = 10
) (
    input wire clk,
    input wire rst_n,
    input wire en,
    output reg [WIDTH-1:0] count,
    output wire wrap
);

assign wrap = (count == MOD - 1) && en;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
    end else if (en) begin
        if (count == MOD - 1) begin
            count <= 0;
        end else begin
            count <= count + 1'b1;
        end
    end
end

endmodule
