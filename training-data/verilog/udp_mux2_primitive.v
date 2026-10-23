primitive mux2_udp (out, sel, a, b);
    output out;
    input sel, a, b;

    table
        // sel a b : out
           0   1 ? : 1;
           0   0 ? : 0;
           1   ? 1 : 1;
           1   ? 0 : 0;
           ?   1 1 : 1;
           ?   0 0 : 0;
    endtable
endprimitive

module udp_mux2_demo (
    input wire sel,
    input wire a,
    input wire b,
    output wire y
);

mux2_udp u0 (y, sel, a, b);

endmodule
