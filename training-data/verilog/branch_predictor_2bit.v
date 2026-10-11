module branch_predictor_2bit (
    input wire clk,
    input wire rst_n,
    input wire update,
    input wire taken,
    output wire predict_taken
);

// 00 strongly not taken, 01 weakly not taken, 10 weakly taken, 11 strongly taken
reg [1:0] state;

assign predict_taken = state[1];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        state <= 2'b01;
    else if (update) begin
        if (taken && state != 2'b11)
            state <= state + 1'b1;
        else if (!taken && state != 2'b00)
            state <= state - 1'b1;
    end
end

endmodule
