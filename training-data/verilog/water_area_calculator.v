// Container area between two bars: min(h1, h2) * distance.
module water_area_calculator (
    input wire [7:0] h1,
    input wire [7:0] h2,
    input wire [3:0] distance,
    output wire [11:0] area
);

wire [7:0] shorter = (h1 < h2) ? h1 : h2;
assign area = shorter * distance;

endmodule
