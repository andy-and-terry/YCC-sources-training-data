module simple_alu_testbench;

reg [3:0] a, b;
reg [2:0] op;
wire [3:0] result;
wire zero;

alu_4bit dut (
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .zero(zero)
);

initial begin
    a = 4'd5; b = 4'd3; op = 3'b000;
    #10 $display("ADD: %d", result);
    op = 3'b001;
    #10 $display("SUB: %d", result);
    $finish;
end

endmodule
