module rom_lookup_table (
    input  wire       clk,
    input  wire [2:0] addr,
    output reg  [7:0] data
);

reg [7:0] rom [0:7];

initial begin
    rom[0] = 8'd0;
    rom[1] = 8'd1;
    rom[2] = 8'd4;
    rom[3] = 8'd9;
    rom[4] = 8'd16;
    rom[5] = 8'd25;
    rom[6] = 8'd36;
    rom[7] = 8'd49;
end

always @(posedge clk) begin
    data <= rom[addr];
end

endmodule
