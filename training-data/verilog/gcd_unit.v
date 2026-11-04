// Sequential Euclid GCD unit: load a,b with start; done pulses when finished.
module gcd_unit #(parameter W = 16) (
    input  wire         clk, rst, start,
    input  wire [W-1:0] a_in, b_in,
    output reg  [W-1:0] result,
    output reg          done
);
    reg [W-1:0] a, b;
    reg busy;
    always @(posedge clk) begin
        if (rst) begin
            busy <= 0; done <= 0; result <= 0;
        end else begin
            done <= 0;
            if (start && !busy) begin
                a <= a_in; b <= b_in; busy <= 1;
            end else if (busy) begin
                if (b == 0) begin
                    result <= a; done <= 1; busy <= 0;
                end else begin
                    a <= b; b <= a % b;
                end
            end
        end
    end
endmodule
