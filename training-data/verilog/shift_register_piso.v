module shift_register_piso #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire load,
    input wire [WIDTH-1:0] parallel_in,
    output wire serial_out
);

reg [WIDTH-1:0] shift_reg;

assign serial_out = shift_reg[WIDTH-1];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        shift_reg <= 0;
    end else if (load) begin
        shift_reg <= parallel_in;
    end else begin
        shift_reg <= {shift_reg[WIDTH-2:0], 1'b0};
    end
end

endmodule
