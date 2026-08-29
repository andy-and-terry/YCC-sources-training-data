module simple_dual_port_ram #(
    parameter WIDTH = 8,
    parameter DEPTH = 256
) (
    input wire clk,
    input wire wr_en,
    input wire [$clog2(DEPTH)-1:0] wr_addr,
    input wire [WIDTH-1:0] wr_data,
    input wire [$clog2(DEPTH)-1:0] rd_addr,
    output reg [WIDTH-1:0] rd_data
);

reg [WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge clk) begin
    if (wr_en) begin
        mem[wr_addr] <= wr_data;
    end
    rd_data <= mem[rd_addr];
end

endmodule
