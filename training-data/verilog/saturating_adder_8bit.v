module saturating_adder_8bit (
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [7:0] sum,
    output wire saturated
);

wire [8:0] full = {1'b0, a} + {1'b0, b};

assign saturated = full[8];
assign sum = full[8] ? 8'hFF : full[7:0];

endmodule
