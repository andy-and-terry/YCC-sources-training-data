module mealy_fsm_vending_machine (
    input wire clk,
    input wire rst_n,
    input wire coin_in,
    output reg dispense
);

localparam IDLE = 1'b0, HAVE_COIN = 1'b1;
reg state;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        dispense <= 1'b0;
    end else begin
        case (state)
            IDLE: begin
                dispense <= 1'b0;
                if (coin_in) state <= HAVE_COIN;
            end
            HAVE_COIN: begin
                if (coin_in) begin
                    dispense <= 1'b1;
                    state <= IDLE;
                end
            end
        endcase
    end
end

endmodule
