module checksum_accumulator (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire valid,
    input wire [7:0] byte_in,
    output wire [7:0] checksum
);

reg [7:0] sum;

// Two's complement checksum: sum of all bytes plus checksum equals zero
assign checksum = ~sum + 8'd1;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        sum <= 8'd0;
    else if (clear)
        sum <= 8'd0;
    else if (valid)
        sum <= sum + byte_in;
end

endmodule
