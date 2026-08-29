module uart_transmitter #(
    parameter CLKS_PER_BIT = 87
) (
    input wire clk,
    input wire rst_n,
    input wire tx_start,
    input wire [7:0] tx_data,
    output reg tx_serial,
    output reg tx_busy
);

localparam IDLE = 0, START = 1, DATA = 2, STOP = 3;
reg [1:0] state;
reg [7:0] shift_reg;
reg [3:0] bit_index;
reg [15:0] clk_count;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        tx_serial <= 1'b1;
        tx_busy <= 1'b0;
        clk_count <= 0;
        bit_index <= 0;
    end else begin
        case (state)
            IDLE: begin
                tx_serial <= 1'b1;
                if (tx_start) begin
                    shift_reg <= tx_data;
                    tx_busy <= 1'b1;
                    state <= START;
                end
            end
            START: begin
                tx_serial <= 1'b0;
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    state <= DATA;
                end
            end
            DATA: begin
                tx_serial <= shift_reg[bit_index];
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    if (bit_index < 7) begin
                        bit_index <= bit_index + 1;
                    end else begin
                        bit_index <= 0;
                        state <= STOP;
                    end
                end
            end
            STOP: begin
                tx_serial <= 1'b1;
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    tx_busy <= 1'b0;
                    state <= IDLE;
                end
            end
        endcase
    end
end

endmodule
