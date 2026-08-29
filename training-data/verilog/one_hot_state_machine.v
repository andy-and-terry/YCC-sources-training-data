module one_hot_state_machine (
    input wire clk,
    input wire rst_n,
    input wire go,
    output reg [3:0] state,
    output wire done
);

localparam IDLE = 4'b0001, RUN = 4'b0010, WAIT = 4'b0100, FINISH = 4'b1000;

assign done = state[3];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
    end else begin
        case (state)
            IDLE: if (go) state <= RUN;
            RUN: state <= WAIT;
            WAIT: state <= FINISH;
            FINISH: state <= IDLE;
            default: state <= IDLE;
        endcase
    end
end

endmodule
