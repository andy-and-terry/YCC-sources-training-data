module bcd_subtractor (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       bin,
    output reg  [3:0] diff,
    output reg        bout
);

integer raw_diff;

always @(*) begin
    raw_diff = a - b - bin;
    if (raw_diff < 0) begin
        diff = raw_diff + 10;
        bout = 1'b1;
    end else begin
        diff = raw_diff[3:0];
        bout = 1'b0;
    end
end

endmodule
