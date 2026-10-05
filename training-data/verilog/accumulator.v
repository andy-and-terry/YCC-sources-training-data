module accumulator #(
    parameter IN_WIDTH = 8,
    parameter ACC_WIDTH = 16
) (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire en,
    input wire [IN_WIDTH-1:0] data_in,
    output reg [ACC_WIDTH-1:0] acc
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        acc <= {ACC_WIDTH{1'b0}};
    else if (clear)
        acc <= {ACC_WIDTH{1'b0}};
    else if (en)
        acc <= acc + data_in;
end

endmodule
