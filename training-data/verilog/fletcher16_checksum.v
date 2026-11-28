module fletcher16_checksum (
    input  wire        clk,
    input  wire        rst,
    input  wire        valid,
    input  wire [7:0]  byte_in,
    output wire [15:0] checksum
);

reg [7:0] s1, s2;
wire [8:0] sum1 = s1 + byte_in;
wire [7:0] n1   = (sum1 >= 255) ? sum1 - 255 : sum1[7:0];
wire [8:0] sum2 = s2 + n1;
wire [7:0] n2   = (sum2 >= 255) ? sum2 - 255 : sum2[7:0];

always @(posedge clk) begin
    if (rst) begin
        s1 <= 8'd0;
        s2 <= 8'd0;
    end else if (valid) begin
        s1 <= n1;
        s2 <= n2;
    end
end

assign checksum = {s2, s1};

endmodule
