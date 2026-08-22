module fsm_traffic_light (
    input wire clk,
    input wire reset,
    output reg [1:0] state
);

localparam RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= RED;
    else begin
        case (state)
            RED:    state <= GREEN;
            GREEN:  state <= YELLOW;
            YELLOW: state <= RED;
            default: state <= RED;
        endcase
    end
end

endmodule
