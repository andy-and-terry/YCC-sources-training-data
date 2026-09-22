// True dual-port RAM: both ports can independently read AND write any
// address every cycle, unlike simple_dual_port_ram.v (one write-only port,
// one read-only port). Writing the same address from both ports on the
// same cycle is a design-level hazard left to the caller to avoid.
module true_dual_port_ram #(
    parameter WIDTH = 8,
    parameter DEPTH = 256
) (
    input wire clk,
    input wire wr_en_a,
    input wire [$clog2(DEPTH)-1:0] addr_a,
    input wire [WIDTH-1:0] wr_data_a,
    output reg [WIDTH-1:0] rd_data_a,
    input wire wr_en_b,
    input wire [$clog2(DEPTH)-1:0] addr_b,
    input wire [WIDTH-1:0] wr_data_b,
    output reg [WIDTH-1:0] rd_data_b
);

reg [WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge clk) begin
    if (wr_en_a) begin
        mem[addr_a] <= wr_data_a;
    end
    rd_data_a <= mem[addr_a];
end

always @(posedge clk) begin
    if (wr_en_b) begin
        mem[addr_b] <= wr_data_b;
    end
    rd_data_b <= mem[addr_b];
end

endmodule
