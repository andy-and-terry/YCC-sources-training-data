// Sequential divisor-sum unit: iterates d from 1 to n-1 accumulating divisors.
module aliquot_divisor_sum (
    input  wire        clk, rst, start,
    input  wire [7:0]  n,
    output reg  [15:0] sum,
    output reg         done
);
    reg [7:0] d;
    reg       busy;
    always @(posedge clk) begin
        if (rst) begin busy <= 0; done <= 0; sum <= 0; end
        else if (start && !busy) begin busy <= 1; done <= 0; d <= 1; sum <= 0; end
        else if (busy) begin
            if (d >= n) begin busy <= 0; done <= 1; end
            else begin
                if (n % d == 0) sum <= sum + d;
                d <= d + 1;
            end
        end
    end
endmodule
