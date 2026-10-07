module digital_stopwatch_bcd_counter (
    input  wire       clk_1hz,
    input  wire       rst_n,
    input  wire       enable,
    output reg  [3:0] seconds_ones,
    output reg  [3:0] seconds_tens
);

always @(posedge clk_1hz or negedge rst_n) begin
    if (!rst_n) begin
        seconds_ones <= 4'd0;
        seconds_tens <= 4'd0;
    end else if (enable) begin
        if (seconds_ones == 4'd9) begin
            seconds_ones <= 4'd0;
            if (seconds_tens == 4'd5) begin
                seconds_tens <= 4'd0;
            end else begin
                seconds_tens <= seconds_tens + 1'b1;
            end
        end else begin
            seconds_ones <= seconds_ones + 1'b1;
        end
    end
end

endmodule
