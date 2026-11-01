// Parity classifier: evil numbers have an even number of 1 bits, odious odd.
module evil_odious_classifier (
    input  wire [7:0] value,
    output wire       is_evil
);
    assign is_evil = ~^value;  // XNOR reduction: 1 when parity is even
endmodule

module evil_odious_classifier_tb;
    reg  [7:0] value;
    wire       is_evil;
    integer    n;

    evil_odious_classifier dut (.value(value), .is_evil(is_evil));

    initial begin
        for (n = 0; n <= 20; n = n + 1) begin
            value = n;
            #1;
            if (is_evil) $write("%0d ", n);
        end
        $write("\n");  // 0 3 5 6 9 10 12 15 17 18 20
        $finish;
    end
endmodule
