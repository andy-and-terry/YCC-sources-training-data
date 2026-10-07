module frequency_counter #(
    parameter GATE_CYCLES = 1000
) (
    input wire clk,
    input wire rst_n,
    input wire signal_in,
    output reg [15:0] freq_count,
    output reg valid
);

reg sig_d1, sig_d2;
reg [15:0] gate_cnt;
reg [15:0] edge_cnt;

wire rising = sig_d1 & ~sig_d2;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sig_d1 <= 1'b0;
        sig_d2 <= 1'b0;
        gate_cnt <= 16'd0;
        edge_cnt <= 16'd0;
        freq_count <= 16'd0;
        valid <= 1'b0;
    end else begin
        sig_d1 <= signal_in;
        sig_d2 <= sig_d1;
        valid <= 1'b0;
        if (gate_cnt == GATE_CYCLES - 1) begin
            freq_count <= edge_cnt + rising;
            valid <= 1'b1;
            edge_cnt <= 16'd0;
            gate_cnt <= 16'd0;
        end else begin
            gate_cnt <= gate_cnt + 1'b1;
            if (rising) edge_cnt <= edge_cnt + 1'b1;
        end
    end
end

endmodule
