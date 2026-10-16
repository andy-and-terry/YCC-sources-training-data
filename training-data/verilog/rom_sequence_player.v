module rom_sequence_player (
    input wire clk,
    input wire rst_n,
    input wire run,
    output reg [7:0] data,
    output reg done
);

reg [7:0] rom [0:7];
reg [3:0] addr;

initial begin
    rom[0] = 8'h10; rom[1] = 8'h20; rom[2] = 8'h40; rom[3] = 8'h80;
    rom[4] = 8'h40; rom[5] = 8'h20; rom[6] = 8'h10; rom[7] = 8'h00;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        addr <= 4'd0;
        data <= 8'h00;
        done <= 1'b0;
    end else if (run && !done) begin
        data <= rom[addr[2:0]];
        if (addr == 4'd7)
            done <= 1'b1;
        else
            addr <= addr + 1'b1;
    end
end

endmodule
