// Concatenation { } and replication {n{ }} operators
module concat_replication_demo (
    input  [3:0] nibble,
    input        bit_in,
    output [7:0] swapped,
    output [7:0] repeated,
    output [7:0] sign_extended,
    output [7:0] padded
);
    assign swapped       = {nibble[1:0], nibble[3:2], nibble};
    assign repeated      = {8{bit_in}};
    assign sign_extended = {{4{nibble[3]}}, nibble};
    assign padded        = {nibble, 4'b0000};
endmodule

module tb;
    reg  [3:0] n;
    reg        b;
    wire [7:0] s, r, se, p;

    concat_replication_demo dut (n, b, s, r, se, p);

    initial begin
        n = 4'b1010; b = 1; #1;
        $display("swapped=%b repeated=%b sext=%b padded=%b", s, r, se, p);
        n = 4'b0110; b = 0; #1;
        $display("swapped=%b repeated=%b sext=%b padded=%b", s, r, se, p);
        $finish;
    end
endmodule
