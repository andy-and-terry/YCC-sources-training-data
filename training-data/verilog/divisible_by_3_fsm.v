// Serial MSB-first input; output high when the bits seen so far are divisible by 3.
module divisible_by_3_fsm (
    input  wire clk,
    input  wire rst_n,
    input  wire bit_in,
    output wire divisible
);

reg [1:0] remainder;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        remainder <= 2'd0;
    else begin
        case (remainder)
            2'd0: remainder <= bit_in ? 2'd1 : 2'd0;
            2'd1: remainder <= bit_in ? 2'd0 : 2'd2;
            2'd2: remainder <= bit_in ? 2'd2 : 2'd1;
            default: remainder <= 2'd0;
        endcase
    end
end

assign divisible = (remainder == 2'd0);

endmodule
