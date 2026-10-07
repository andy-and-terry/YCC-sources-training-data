module shift_register_sipo #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             serial_in,
    output reg  [WIDTH-1:0] parallel_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        parallel_out <= {WIDTH{1'b0}};
    end else begin
        parallel_out <= {parallel_out[WIDTH-2:0], serial_in};
    end
end

endmodule
