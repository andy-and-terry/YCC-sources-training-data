module bit_serial_adder (
    input wire clk,
    input wire rst_n,
    input wire clear,
    input wire a,
    input wire b,
    output reg sum
);

reg carry;

// One full-adder plus a carry flip-flop: LSB-first serial addition
wire s = a ^ b ^ carry;
wire c = (a & b) | (carry & (a ^ b));

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        carry <= 1'b0;
        sum <= 1'b0;
    end else if (clear) begin
        carry <= 1'b0;
        sum <= 1'b0;
    end else begin
        sum <= s;
        carry <= c;
    end
end

endmodule
