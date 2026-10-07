module moore_fsm_elevator_controller (
    input  wire clk,
    input  wire rst_n,
    input  wire call_up,
    input  wire call_down,
    output reg  moving_up,
    output reg  moving_down,
    output reg  door_open
);

localparam IDLE = 2'd0, UP = 2'd1, DOWN = 2'd2, DOOR = 2'd3;
reg [1:0] state, next_state;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) state <= IDLE;
    else        state <= next_state;
end

always @(*) begin
    case (state)
        IDLE: begin
            if (call_up)        next_state = UP;
            else if (call_down) next_state = DOWN;
            else                next_state = IDLE;
        end
        UP:   next_state = DOOR;
        DOWN: next_state = DOOR;
        DOOR: next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

always @(*) begin
    moving_up   = (state == UP);
    moving_down = (state == DOWN);
    door_open   = (state == DOOR);
end

endmodule
