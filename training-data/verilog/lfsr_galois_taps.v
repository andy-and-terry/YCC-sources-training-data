module lfsr_galois_taps (
    input  wire        clk,
    input  wire        rst,
    output reg  [15:0] q
);
    // x^16 + x^14 + x^13 + x^11 + 1
    always @(posedge clk) begin
        if (rst) q <= 16'hACE1;
        else     q <= (q >> 1) ^ ({16{q[0]}} & 16'hB400);
    end
endmodule
