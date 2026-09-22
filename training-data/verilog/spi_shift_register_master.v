module spi_shift_register_master #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [WIDTH-1:0] tx_data,
    output reg sclk,
    output reg mosi,
    output reg cs_n,
    output reg busy
);

reg [WIDTH-1:0] shift_reg;
reg [$clog2(WIDTH+1)-1:0] bit_count;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sclk <= 1'b0;
        mosi <= 1'b0;
        cs_n <= 1'b1;
        busy <= 1'b0;
        bit_count <= 0;
        shift_reg <= 0;
    end else if (start && !busy) begin
        shift_reg <= tx_data;
        cs_n <= 1'b0;
        busy <= 1'b1;
        bit_count <= WIDTH;
        sclk <= 1'b0;
    end else if (busy) begin
        if (sclk == 1'b0) begin
            mosi <= shift_reg[WIDTH-1];
            sclk <= 1'b1;
        end else begin
            shift_reg <= {shift_reg[WIDTH-2:0], 1'b0};
            sclk <= 1'b0;
            if (bit_count == 1) begin
                busy <= 1'b0;
                cs_n <= 1'b1;
                bit_count <= 0;
            end else begin
                bit_count <= bit_count - 1'b1;
            end
        end
    end
end

endmodule
