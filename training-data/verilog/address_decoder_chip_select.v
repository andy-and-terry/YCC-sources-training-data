module address_decoder_chip_select #(
    parameter ADDR_WIDTH = 8
) (
    input wire [ADDR_WIDTH-1:0] address,
    input wire enable,
    output reg [3:0] chip_select
);

always @(*) begin
    if (!enable) begin
        chip_select = 4'b0000;
    end else begin
        case (address[ADDR_WIDTH-1:ADDR_WIDTH-2])
            2'b00: chip_select = 4'b0001;
            2'b01: chip_select = 4'b0010;
            2'b10: chip_select = 4'b0100;
            default: chip_select = 4'b1000;
        endcase
    end
end

endmodule
