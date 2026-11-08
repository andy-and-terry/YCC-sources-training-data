module mux4to1 (
    input wire [3:0] d,
    input wire [1:0] sel,
    output wire y
);
    assign y = d[sel];
endmodule
