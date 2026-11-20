// Combinational sorter for four 4-bit values using a compare-swap network.
module bead_sort_4 (
    input  wire [15:0] in,
    output wire [15:0] out
);
    wire [3:0] a0 = in[3:0], a1 = in[7:4], a2 = in[11:8], a3 = in[15:12];
    wire [3:0] b0 = (a0 < a1) ? a0 : a1, b1 = (a0 < a1) ? a1 : a0;
    wire [3:0] b2 = (a2 < a3) ? a2 : a3, b3 = (a2 < a3) ? a3 : a2;
    wire [3:0] c0 = (b0 < b2) ? b0 : b2, c2 = (b0 < b2) ? b2 : b0;
    wire [3:0] c1 = (b1 < b3) ? b1 : b3, c3 = (b1 < b3) ? b3 : b1;
    wire [3:0] d1 = (c1 < c2) ? c1 : c2, d2 = (c1 < c2) ? c2 : c1;
    assign out = {c3, d2, d1, c0};
endmodule
