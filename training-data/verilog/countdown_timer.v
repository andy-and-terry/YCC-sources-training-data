module countdown_timer #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire load,
    input wire [WIDTH-1:0] load_value,
    input wire enable,
    output reg [WIDTH-1:0] remaining,
    output wire expired
);

assign expired = (remaining == {WIDTH{1'b0}});

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        remaining <= {WIDTH{1'b0}};
    end else if (load) begin
        remaining <= load_value;
    end else if (enable && !expired) begin
        remaining <= remaining - 1'b1;
    end
end

endmodule
