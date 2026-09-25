module circular_rotate_register #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire load,
    input wire rotate,
    input wire [WIDTH-1:0] parallel_in,
    output reg [WIDTH-1:0] data_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_out <= {WIDTH{1'b0}};
    end else if (load) begin
        data_out <= parallel_in;
    end else if (rotate) begin
        data_out <= {data_out[WIDTH-2:0], data_out[WIDTH-1]};
    end
end

endmodule
