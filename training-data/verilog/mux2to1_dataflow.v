module mux2to1 #(parameter W = 8) (
    input  wire [W-1:0] a, b,
    input  wire         sel,
    output wire [W-1:0] y
);
    assign y = sel ? b : a;
endmodule
