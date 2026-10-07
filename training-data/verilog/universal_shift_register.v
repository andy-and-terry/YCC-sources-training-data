module universal_shift_register #(
    parameter WIDTH = 4
) (
    input wire clk,
    input wire rst_n,
    input wire [1:0] mode,      // 00: hold, 01: shift right, 10: shift left, 11: parallel load
    input wire serial_in_right,
    input wire serial_in_left,
    input wire [WIDTH-1:0] parallel_in,
    output reg [WIDTH-1:0] data_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_out <= {WIDTH{1'b0}};
    end else begin
        case (mode)
            2'b00: data_out <= data_out;
            2'b01: data_out <= {serial_in_right, data_out[WIDTH-1:1]};
            2'b10: data_out <= {data_out[WIDTH-2:0], serial_in_left};
            2'b11: data_out <= parallel_in;
        endcase
    end
end

endmodule
