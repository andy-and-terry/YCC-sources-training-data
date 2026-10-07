module sr_flip_flop (
    input wire clk,
    input wire rst_n,
    input wire s,
    input wire r,
    output reg q,
    output wire qn
);

// Unlike sr_latch.v (level-sensitive, combinational), this version only
// samples s/r on the rising clock edge, and gives the s=r=1 case a defined
// outcome instead of leaving it as an invalid/oscillating state.
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        q <= 1'b0;
    end else begin
        case ({s, r})
            2'b00: q <= q;    // hold
            2'b01: q <= 1'b0; // reset
            2'b10: q <= 1'b1; // set
            2'b11: q <= 1'b0; // invalid input, resolved as reset
        endcase
    end
end

assign qn = ~q;

endmodule
