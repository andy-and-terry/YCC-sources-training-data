module rising_edge (
    input  wire clk, sig,
    output wire pulse
);
    reg prev;
    always @(posedge clk) prev <= sig;
    assign pulse = sig & ~prev;
endmodule
