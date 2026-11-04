// 8-bit maximal-length Fibonacci LFSR, taps 8,6,5,4
module lfsr_8bit (
    input  wire       clk, rst,
    output reg  [7:0] q
);
    wire feedback = q[7] ^ q[5] ^ q[4] ^ q[3];
    always @(posedge clk) begin
        if (rst) q <= 8'h01;
        else     q <= {q[6:0], feedback};
    end
endmodule
