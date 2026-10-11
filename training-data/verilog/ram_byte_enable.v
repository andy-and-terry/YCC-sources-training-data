module ram_byte_enable #(
    parameter ADDR_W = 6
) (
    input wire clk,
    input wire we,
    input wire [3:0] be,
    input wire [ADDR_W-1:0] addr,
    input wire [31:0] wdata,
    output reg [31:0] rdata
);

reg [31:0] mem [0:(1<<ADDR_W)-1];

always @(posedge clk) begin
    if (we) begin
        if (be[0]) mem[addr][7:0]   <= wdata[7:0];
        if (be[1]) mem[addr][15:8]  <= wdata[15:8];
        if (be[2]) mem[addr][23:16] <= wdata[23:16];
        if (be[3]) mem[addr][31:24] <= wdata[31:24];
    end
    rdata <= mem[addr];
end

endmodule
