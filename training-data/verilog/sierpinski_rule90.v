module sierpinski_rule90 (
    input  wire        clk,
    input  wire        rst,
    output reg  [15:0] cells
);
    // elementary cellular automaton rule 90: next = left XOR right
    always @(posedge clk) begin
        if (rst) cells <= 16'h0100;
        else     cells <= {cells[14:0], cells[15]} ^ {cells[0], cells[15:1]};
    end
endmodule
