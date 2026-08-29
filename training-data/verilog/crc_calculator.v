module crc_calculator (
    input wire clk,
    input wire rst_n,
    input wire data_in,
    input wire data_valid,
    output wire [7:0] crc_out
);

reg [7:0] crc_reg;
wire feedback;

assign feedback = crc_reg[7] ^ data_in;
assign crc_out = crc_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        crc_reg <= 8'hFF;
    end else if (data_valid) begin
        crc_reg <= {crc_reg[6:0], 1'b0} ^ (feedback ? 8'h07 : 8'h00);
    end
end

endmodule
