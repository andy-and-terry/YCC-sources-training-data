// Rail index of position i in a 3-rail zigzag (cycle length 4)
module rail_index (
    input  wire [7:0] i,
    output wire [1:0] rail
);
    wire [1:0] m = i[1:0];          // i mod 4
    assign rail = (m == 2'd3) ? 2'd1 : m;
endmodule
