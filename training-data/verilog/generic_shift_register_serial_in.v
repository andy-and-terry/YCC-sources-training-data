module generic_shift_register_serial_in #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire serial_in,
    output wire [WIDTH-1:0] parallel_out
);

reg [WIDTH-1:0] shift_reg;

assign parallel_out = shift_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        shift_reg <= 0;
    end else begin
        shift_reg <= {shift_reg[WIDTH-2:0], serial_in};
    end
end

endmodule
