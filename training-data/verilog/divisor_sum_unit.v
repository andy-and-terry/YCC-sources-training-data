// Sum of proper divisors d(n) (combinational, for small n); amicable pairs have d(a)=b, d(b)=a
module divisor_sum_unit #(
    parameter WIDTH = 10
) (
    input  wire [WIDTH-1:0]  n,
    output reg  [WIDTH+1:0]  sum
);

integer i;

always @* begin
    sum = 0;
    for (i = 1; i < (1 << WIDTH); i = i + 1)
        if (i < n && (n % i) == 0)
            sum = sum + i;
end

endmodule
