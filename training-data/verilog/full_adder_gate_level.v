module full_adder_gate_level (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

wire axb, a_and_b, axb_and_cin;

xor (axb, a, b);
xor (sum, axb, cin);

and (a_and_b, a, b);
and (axb_and_cin, axb, cin);
or  (cout, a_and_b, axb_and_cin);

endmodule
