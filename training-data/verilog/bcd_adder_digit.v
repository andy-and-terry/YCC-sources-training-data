// Adds two BCD digits plus carry-in, producing a BCD digit and carry-out.
module bcd_adder_digit (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

wire [4:0] raw = a + b + cin;
wire adjust = (raw > 5'd9);
wire [4:0] corrected = adjust ? raw + 5'd6 : raw;

assign sum = corrected[3:0];
assign cout = adjust;

endmodule
