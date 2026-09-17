module single_port_ram #(
    parameter WIDTH = 8,
    parameter DEPTH = 256
) (
    input wire clk,
    input wire we,
    input wire [$clog2(DEPTH)-1:0] addr,
    input wire [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

reg [WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge clk) begin
    if (we) begin
        mem[addr] <= din;
        dout <= din;
    end else begin
        dout <= mem[addr];
    end
end

endmodule
