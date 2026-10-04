module lookup_table_rom (
    input wire clk,
    input wire [3:0] addr,
    output reg [7:0] data
);

reg [7:0] rom [0:15];

initial begin
    rom[0]  = 8'd0;   rom[1]  = 8'd1;   rom[2]  = 8'd4;   rom[3]  = 8'd9;
    rom[4]  = 8'd16;  rom[5]  = 8'd25;  rom[6]  = 8'd36;  rom[7]  = 8'd49;
    rom[8]  = 8'd64;  rom[9]  = 8'd81;  rom[10] = 8'd100; rom[11] = 8'd121;
    rom[12] = 8'd144; rom[13] = 8'd169; rom[14] = 8'd196; rom[15] = 8'd225;
end

always @(posedge clk) begin
    data <= rom[addr];
end

endmodule
