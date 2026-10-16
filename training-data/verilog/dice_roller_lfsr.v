module dice_roller_lfsr (
    input wire clk,
    input wire rst_n,
    input wire roll,
    output reg [2:0] face
);

reg [7:0] lfsr;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        lfsr <= 8'hA5;
    else
        lfsr <= {lfsr[6:0], lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3]};
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        face <= 3'd1;
    else if (roll)
        face <= (lfsr[2:0] % 6) + 3'd1;
end

endmodule
