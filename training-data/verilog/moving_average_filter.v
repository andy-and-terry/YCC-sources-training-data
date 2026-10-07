module moving_average_filter (
    input wire clk,
    input wire rst_n,
    input wire en,
    input wire [7:0] sample_in,
    output wire [7:0] average
);

// 4-tap moving average using a sample window and running sum
reg [7:0] window [0:3];
reg [9:0] sum;
integer i;

assign average = sum[9:2];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 4; i = i + 1) window[i] <= 8'd0;
        sum <= 10'd0;
    end else if (en) begin
        window[0] <= sample_in;
        window[1] <= window[0];
        window[2] <= window[1];
        window[3] <= window[2];
        sum <= sum + sample_in - window[3];
    end
end

endmodule
