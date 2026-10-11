module down_counter_with_load #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire load,
    input wire en,
    input wire [WIDTH-1:0] load_value,
    output reg [WIDTH-1:0] count,
    output wire zero
);

assign zero = (count == {WIDTH{1'b0}});

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        count <= {WIDTH{1'b0}};
    else if (load)
        count <= load_value;
    else if (en && !zero)
        count <= count - 1'b1;
end

endmodule
