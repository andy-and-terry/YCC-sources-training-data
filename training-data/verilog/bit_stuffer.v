module bit_stuffer (
    input wire clk,
    input wire rst_n,
    input wire in_bit,
    input wire in_valid,
    output reg out_bit,
    output reg out_valid,
    output wire stalled
);

// HDLC-style stuffing: after five consecutive 1s insert a 0.
reg [2:0] ones;
reg pending_zero;

assign stalled = pending_zero;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ones <= 3'd0;
        pending_zero <= 1'b0;
        out_bit <= 1'b0;
        out_valid <= 1'b0;
    end else if (pending_zero) begin
        out_bit <= 1'b0;
        out_valid <= 1'b1;
        pending_zero <= 1'b0;
        ones <= 3'd0;
    end else if (in_valid) begin
        out_bit <= in_bit;
        out_valid <= 1'b1;
        if (in_bit) begin
            if (ones == 3'd4) begin
                pending_zero <= 1'b1;
                ones <= 3'd5;
            end else begin
                ones <= ones + 3'd1;
            end
        end else begin
            ones <= 3'd0;
        end
    end else begin
        out_valid <= 1'b0;
    end
end

endmodule
