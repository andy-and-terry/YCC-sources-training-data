module bidirectional_shift_register #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire en,
    input wire dir,
    input wire serial_in,
    output reg [WIDTH-1:0] q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        q <= {WIDTH{1'b0}};
    else if (en) begin
        if (dir)
            q <= {serial_in, q[WIDTH-1:1]};
        else
            q <= {q[WIDTH-2:0], serial_in};
    end
end

endmodule
