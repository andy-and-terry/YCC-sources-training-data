module lah_number_calc (
    input  wire [2:0]  n,       // 1..5
    input  wire [2:0]  k,       // 1..n
    output reg  [15:0] lah
);

reg [15:0] c, f;
integer i;

always @* begin
    c = 1;
    f = 1;
    for (i = 0; i < 5; i = i + 1)
        if (i + 1 < k) c = c * (n - 1 - i) / (i + 1);
    for (i = 2; i <= 5; i = i + 1)
        if (i > k && i <= n) f = f * i;
    lah = c * f;
end

endmodule
