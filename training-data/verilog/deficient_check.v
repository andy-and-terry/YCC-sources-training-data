// Is n (1..31) deficient, i.e. sum of divisors < 2n?
module deficient_check (
    input  wire [4:0] n,
    output wire       deficient
);
    reg [7:0] sigma;
    integer d;
    always @* begin
        sigma = 0;
        for (d = 1; d < 32; d = d + 1)
            if (d <= n && (n % d) == 0) sigma = sigma + d;
    end
    assign deficient = (n != 0) && (sigma < {n, 1'b0});
endmodule
