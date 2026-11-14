module adder #(parameter W = 8) (
    input [W-1:0] a, b, output [W:0] sum
);
    assign sum = a + b;
endmodule
