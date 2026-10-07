module min_max_selector (
    input  wire [7:0] a,
    input  wire [7:0] b,
    output reg  [7:0] min_val,
    output reg  [7:0] max_val
);

always @(*) begin
    if (a < b) begin
        min_val = a;
        max_val = b;
    end else begin
        min_val = b;
        max_val = a;
    end
end

endmodule
