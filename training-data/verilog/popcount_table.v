// Population count (number of set bits) for 0..15
module PopcountTable (
    input  wire [3:0] value,
    output reg  [2:0] count
);
    integer i;

    always @(*) begin
        count = 0;
        for (i = 0; i < 4; i = i + 1)
            count = count + value[i];
    end
endmodule
