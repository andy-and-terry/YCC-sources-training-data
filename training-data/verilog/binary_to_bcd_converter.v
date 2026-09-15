module binary_to_bcd_converter (
    input wire [7:0] binary_in,
    output wire [3:0] bcd_hundreds,
    output wire [3:0] bcd_tens,
    output wire [3:0] bcd_ones
);

integer i;
reg [19:0] shift_reg;

always @(*) begin
    shift_reg = {12'd0, binary_in};
    for (i = 0; i < 8; i = i + 1) begin
        if (shift_reg[19:16] >= 5)
            shift_reg[19:16] = shift_reg[19:16] + 3;
        if (shift_reg[15:12] >= 5)
            shift_reg[15:12] = shift_reg[15:12] + 3;
        if (shift_reg[11:8] >= 5)
            shift_reg[11:8] = shift_reg[11:8] + 3;
        shift_reg = shift_reg << 1;
    end
end

assign bcd_hundreds = shift_reg[19:16];
assign bcd_tens = shift_reg[15:12];
assign bcd_ones = shift_reg[11:8];

endmodule
