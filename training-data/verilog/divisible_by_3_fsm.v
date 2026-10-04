module divisible_by_3_fsm (
    input wire clk,
    input wire rst_n,
    input wire bit_in,
    output wire divisible
);

// state tracks the remainder (mod 3) of the binary number received MSB first
reg [1:0] rem;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rem <= 2'd0;
    end else begin
        case ({rem, bit_in})
            3'b000: rem <= 2'd0;
            3'b001: rem <= 2'd1;
            3'b010: rem <= 2'd2;
            3'b011: rem <= 2'd0;
            3'b100: rem <= 2'd1;
            3'b101: rem <= 2'd2;
            default: rem <= 2'd0;
        endcase
    end
end

assign divisible = (rem == 2'd0);

endmodule
