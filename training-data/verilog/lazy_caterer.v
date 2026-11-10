// Lazy caterer's sequence (n*n + n + 2) / 2, computed combinationally.
module lazy_caterer (
    input  wire [3:0] cuts,
    output wire [7:0] pieces
);
    wire [7:0] n = {4'b0, cuts};
    assign pieces = (n * n + n + 8'd2) >> 1;
endmodule

module lazy_caterer_tb;
    reg  [3:0] cuts;
    wire [7:0] pieces;
    lazy_caterer dut (.cuts(cuts), .pieces(pieces));
    integer i;
    initial begin
        for (i = 0; i < 10; i = i + 1) begin
            cuts = i;
            #1 $write("%0d ", pieces);
        end
        $write("\n");  // 1 2 4 7 11 16 22 29 37 46
    end
endmodule
