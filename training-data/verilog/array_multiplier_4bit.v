module array_multiplier_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [7:0] product
);

wire [3:0] pp0, pp1, pp2, pp3;

assign pp0 = a & {4{b[0]}};
assign pp1 = a & {4{b[1]}};
assign pp2 = a & {4{b[2]}};
assign pp3 = a & {4{b[3]}};

assign product = ({4'b0, pp0}) +
                  ({3'b0, pp1, 1'b0}) +
                  ({2'b0, pp2, 2'b0}) +
                  ({1'b0, pp3, 3'b0});

endmodule
