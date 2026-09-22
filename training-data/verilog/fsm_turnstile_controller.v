// Two-state Moore FSM: a coin unlocks the turnstile, a push through the
// gate re-locks it. Output depends only on state, unlike the Mealy vending
// machine elsewhere in this folder whose output also depends on the input.
module fsm_turnstile_controller (
    input wire clk,
    input wire rst_n,
    input wire coin,
    input wire push,
    output wire unlocked
);

localparam LOCKED = 1'b0, UNLOCKED = 1'b1;
reg state;

assign unlocked = (state == UNLOCKED);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= LOCKED;
    end else begin
        case (state)
            LOCKED:   if (coin) state <= UNLOCKED;
            UNLOCKED: if (push) state <= LOCKED;
        endcase
    end
end

endmodule
