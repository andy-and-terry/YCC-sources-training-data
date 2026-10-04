module countdown_timer #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             load,
    input  wire [WIDTH-1:0] load_value,
    output reg  [WIDTH-1:0] remaining,
    output wire             expired
);

assign expired = (remaining == {WIDTH{1'b0}});

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        remaining <= {WIDTH{1'b0}};
    else if (load)
        remaining <= load_value;
    else if (!expired)
        remaining <= remaining - 1'b1;
end

endmodule
