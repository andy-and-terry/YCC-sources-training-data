module rolling_checksum_accum (
    input  wire       clk, rst, valid,
    input  wire [7:0] data,
    output reg  [15:0] sum
);
    // simple polynomial hash: sum = sum * 31 + data (mod 2^16)
    always @(posedge clk) begin
        if (rst)        sum <= 0;
        else if (valid) sum <= (sum << 5) - sum + data;
    end
endmodule
