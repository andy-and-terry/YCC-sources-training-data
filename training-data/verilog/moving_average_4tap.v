module moving_average_4tap (
    input wire clk,
    input wire rst_n,
    input wire valid,
    input wire [7:0] sample_in,
    output wire [7:0] average
);

reg [7:0] taps [0:3];
integer i;

wire [9:0] sum = taps[0] + taps[1] + taps[2] + taps[3];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 4; i = i + 1)
            taps[i] <= 8'd0;
    end else if (valid) begin
        taps[0] <= sample_in;
        taps[1] <= taps[0];
        taps[2] <= taps[1];
        taps[3] <= taps[2];
    end
end

assign average = sum[9:2];   // divide by 4

endmodule
