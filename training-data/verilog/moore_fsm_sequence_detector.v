module moore_fsm_sequence_detector (
    input wire clk,
    input wire rst_n,
    input wire data_in,
    output wire detected
);

localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
reg [1:0] state, next_state;

assign detected = (state == S3);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= S0;
    end else begin
        state <= next_state;
    end
end

always @(*) begin
    case (state)
        S0: next_state = data_in ? S1 : S0;
        S1: next_state = data_in ? S1 : S2;
        S2: next_state = data_in ? S3 : S0;
        S3: next_state = data_in ? S1 : S2;
        default: next_state = S0;
    endcase
end

endmodule
