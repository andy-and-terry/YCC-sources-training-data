module i2c_shift_register_master #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [WIDTH-1:0] tx_data,
    output reg scl,
    output reg sda,
    output reg busy
);

localparam IDLE           = 3'd0,
           START_COND     = 3'd1,
           SHIFT_LOW      = 3'd2,
           SHIFT_HIGH     = 3'd3,
           STOP_COND      = 3'd4,
           STOP_RAISE_SCL = 3'd5,
           STOP_RAISE_SDA = 3'd6;

reg [2:0] state;
reg [WIDTH-1:0] shift_reg;
reg [$clog2(WIDTH+1)-1:0] bit_count;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        scl <= 1'b1;
        sda <= 1'b1;
        busy <= 1'b0;
        state <= IDLE;
        bit_count <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (start && !busy) begin
                    shift_reg <= tx_data;
                    busy <= 1'b1;
                    sda <= 1'b1;
                    scl <= 1'b1;
                    state <= START_COND;
                end
            end
            START_COND: begin
                sda <= 1'b0;
                bit_count <= WIDTH;
                state <= SHIFT_LOW;
            end
            SHIFT_LOW: begin
                scl <= 1'b0;
                sda <= shift_reg[WIDTH-1];
                state <= SHIFT_HIGH;
            end
            SHIFT_HIGH: begin
                scl <= 1'b1;
                shift_reg <= {shift_reg[WIDTH-2:0], 1'b0};
                if (bit_count == 1) begin
                    state <= STOP_COND;
                end else begin
                    bit_count <= bit_count - 1'b1;
                    state <= SHIFT_LOW;
                end
            end
            STOP_COND: begin
                scl <= 1'b0;
                sda <= 1'b0;
                state <= STOP_RAISE_SCL;
            end
            STOP_RAISE_SCL: begin
                scl <= 1'b1;
                sda <= 1'b0;
                state <= STOP_RAISE_SDA;
            end
            STOP_RAISE_SDA: begin
                scl <= 1'b1;
                sda <= 1'b1;
                busy <= 1'b0;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
