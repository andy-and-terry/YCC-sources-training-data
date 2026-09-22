// Classic shift-and-add sequential multiplier: one bit of the multiplier
// is consumed per clock over 4 cycles, versus the combinational
// array/Booth multipliers and the pipelined multiplier elsewhere in this
// folder, which produce a result in a single cycle (or pipeline stage).
module sequential_multiplier_4bit (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [3:0] multiplicand,
    input wire [3:0] multiplier,
    output reg [7:0] product,
    output reg done
);

reg [7:0] multiplicand_reg;
reg [3:0] multiplier_reg;
reg [2:0] count;
reg busy;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        product <= 8'b0;
        multiplicand_reg <= 8'b0;
        multiplier_reg <= 4'b0;
        count <= 3'b0;
        busy <= 1'b0;
        done <= 1'b0;
    end else begin
        done <= 1'b0;
        if (start && !busy) begin
            product <= 8'b0;
            multiplicand_reg <= {4'b0000, multiplicand};
            multiplier_reg <= multiplier;
            count <= 3'd4;
            busy <= 1'b1;
        end else if (busy) begin
            if (multiplier_reg[0]) begin
                product <= product + multiplicand_reg;
            end
            multiplicand_reg <= multiplicand_reg << 1;
            multiplier_reg <= multiplier_reg >> 1;
            count <= count - 1'b1;
            if (count == 3'd1) begin
                busy <= 1'b0;
                done <= 1'b1;
            end
        end
    end
end

endmodule
