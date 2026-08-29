module register_file #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
) (
    input wire clk,
    input wire wr_en,
    input wire [$clog2(DEPTH)-1:0] wr_addr,
    input wire [WIDTH-1:0] wr_data,
    input wire [$clog2(DEPTH)-1:0] rd_addr1,
    input wire [$clog2(DEPTH)-1:0] rd_addr2,
    output wire [WIDTH-1:0] rd_data1,
    output wire [WIDTH-1:0] rd_data2
);

reg [WIDTH-1:0] registers [0:DEPTH-1];

always @(posedge clk) begin
    if (wr_en) begin
        registers[wr_addr] <= wr_data;
    end
end

assign rd_data1 = registers[rd_addr1];
assign rd_data2 = registers[rd_addr2];

endmodule
