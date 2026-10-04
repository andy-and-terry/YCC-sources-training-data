module moving_average_4tap (
    input wire clk,
    input wire rst_n,
    input wire sample_valid,
    input wire [7:0] sample,
    output reg [7:0] average
);

reg [7:0] s0, s1, s2, s3;
wire [9:0] sum = s0 + s1 + s2 + s3;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        s0 <= 8'd0;
        s1 <= 8'd0;
        s2 <= 8'd0;
        s3 <= 8'd0;
        average <= 8'd0;
    end else if (sample_valid) begin
        s0 <= sample;
        s1 <= s0;
        s2 <= s1;
        s3 <= s2;
        // average of the window as it was before this sample shifts in
        average <= (sample + s0 + s1 + s2) >> 2;
    end
end

endmodule
