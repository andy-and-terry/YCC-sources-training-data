module uart_receiver #(
    parameter CLKS_PER_BIT = 87
) (
    input wire clk,
    input wire rst_n,
    input wire rx_serial,
    output reg [7:0] rx_data,
    output reg rx_done
);

localparam IDLE = 0, START = 1, DATA = 2, STOP = 3;
reg [1:0] state;
reg [7:0] shift_reg;
reg [3:0] bit_index;
reg [15:0] clk_count;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        rx_done <= 1'b0;
        clk_count <= 0;
        bit_index <= 0;
        shift_reg <= 8'b0;
        rx_data <= 8'b0;
    end else begin
        rx_done <= 1'b0;
        case (state)
            IDLE: begin
                if (rx_serial == 1'b0) begin
                    clk_count <= 0;
                    state <= START;
                end
            end
            START: begin
                if (clk_count == (CLKS_PER_BIT - 1) / 2) begin
                    if (rx_serial == 1'b0) begin
                        clk_count <= 0;
                        bit_index <= 0;
                        state <= DATA;
                    end else begin
                        state <= IDLE;
                    end
                end else begin
                    clk_count <= clk_count + 1;
                end
            end
            DATA: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    shift_reg[bit_index] <= rx_serial;
                    if (bit_index < 7) begin
                        bit_index <= bit_index + 1;
                    end else begin
                        state <= STOP;
                    end
                end
            end
            STOP: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    rx_data <= shift_reg;
                    rx_done <= 1'b1;
                    state <= IDLE;
                end
            end
        endcase
    end
end

endmodule
