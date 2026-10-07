module integer_sqrt (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [15:0] radicand,
    output reg [7:0] root,
    output reg done
);

// Bit-by-bit square root: try each result bit from MSB down
reg [2:0] bit_idx;
reg [7:0] trial;
reg busy;
reg [15:0] value;

wire [7:0] candidate = trial | (8'd1 << bit_idx);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        root <= 8'd0;
        done <= 1'b0;
        busy <= 1'b0;
        trial <= 8'd0;
        bit_idx <= 3'd7;
        value <= 16'd0;
    end else begin
        done <= 1'b0;
        if (start && !busy) begin
            busy <= 1'b1;
            value <= radicand;
            trial <= 8'd0;
            bit_idx <= 3'd7;
        end else if (busy) begin
            if (candidate * candidate <= value)
                trial <= candidate;
            if (bit_idx == 3'd0) begin
                busy <= 1'b0;
                done <= 1'b1;
                root <= (candidate * candidate <= value) ? candidate : trial;
            end else begin
                bit_idx <= bit_idx - 1'b1;
            end
        end
    end
end

endmodule
