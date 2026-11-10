// Moser-de Bruijn: spread the bits of i onto the even bit positions (base-4 reading).
module moser_de_bruijn (
    input  wire [3:0]  i,
    output wire [7:0]  value
);
    assign value = {1'b0, i[3], 1'b0, i[2], 1'b0, i[1], 1'b0, i[0]};
    // each bit k lands at position 2k, i.e. contributes 4^k
endmodule

module moser_de_bruijn_tb;
    reg  [3:0] i;
    wire [7:0] value;
    moser_de_bruijn dut (.i(i), .value(value));
    integer k;
    initial begin
        for (k = 0; k < 10; k = k + 1) begin
            i = k;
            #1 $write("%0d ", value);
        end
        $write("\n");  // 0 1 4 5 16 17 20 21 64 65
    end
endmodule
