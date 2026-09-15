module rom_lookup (
    input wire clk,
    input wire [2:0] addr,
    output reg [7:0] data_out
);

reg [7:0] mem [0:7];

initial begin
    mem[0] = 8'd10;
    mem[1] = 8'd20;
    mem[2] = 8'd30;
    mem[3] = 8'd40;
    mem[4] = 8'd50;
    mem[5] = 8'd60;
    mem[6] = 8'd70;
    mem[7] = 8'd80;
end

always @(posedge clk) begin
    data_out <= mem[addr];
end

endmodule
