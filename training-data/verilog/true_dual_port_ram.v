module true_dual_port_ram #(
    parameter WIDTH = 8,
    parameter DEPTH = 256
) (
    input wire clk,
    input wire we_a,
    input wire [$clog2(DEPTH)-1:0] addr_a,
    input wire [WIDTH-1:0] din_a,
    output reg [WIDTH-1:0] dout_a,
    input wire we_b,
    input wire [$clog2(DEPTH)-1:0] addr_b,
    input wire [WIDTH-1:0] din_b,
    output reg [WIDTH-1:0] dout_b
);

reg [WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge clk) begin
    if (we_a) begin
        mem[addr_a] <= din_a;
        dout_a <= din_a;
    end else begin
        dout_a <= mem[addr_a];
    end
end

always @(posedge clk) begin
    if (we_b) begin
        mem[addr_b] <= din_b;
        dout_b <= din_b;
    end else begin
        dout_b <= mem[addr_b];
    end
end

endmodule
