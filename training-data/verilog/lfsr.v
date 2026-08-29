module lfsr (
    input wire clk,
    input wire rst_n,
    output wire [7:0] value
);

reg [7:0] shift_reg;
wire feedback;

assign feedback = shift_reg[7] ^ shift_reg[5] ^ shift_reg[4] ^ shift_reg[3];
assign value = shift_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        shift_reg <= 8'hFF;
    end else begin
        shift_reg <= {shift_reg[6:0], feedback};
    end
end

endmodule
