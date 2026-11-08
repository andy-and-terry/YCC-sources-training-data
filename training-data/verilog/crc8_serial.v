module crc8_serial (
    input wire clk,
    input wire rst,
    input wire bit_in,
    output reg [7:0] crc
);
    wire feedback = crc[7] ^ bit_in;
    always @(posedge clk or posedge rst) begin
        if (rst) crc <= 8'h00;
        else crc <= {crc[6:0], 1'b0} ^ (feedback ? 8'h07 : 8'h00);
    end
endmodule
