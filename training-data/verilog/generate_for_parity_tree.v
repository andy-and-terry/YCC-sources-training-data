// XOR reduction built with a generate-for loop, one level at a time
module parity_chain #(parameter N = 8) (
    input  [N-1:0] data,
    output         parity
);
    wire [N-1:0] acc;
    assign acc[0] = data[0];

    genvar i;
    generate
        for (i = 1; i < N; i = i + 1) begin : stage
            assign acc[i] = acc[i-1] ^ data[i];
        end
    endgenerate

    assign parity = acc[N-1];
endmodule

module tb;
    reg  [7:0] d;
    wire p;

    parity_chain #(.N(8)) dut (.data(d), .parity(p));

    initial begin
        d = 8'b0000_0000; #1; $display("%b -> %b", d, p);
        d = 8'b0000_0111; #1; $display("%b -> %b", d, p);
        d = 8'b1111_0000; #1; $display("%b -> %b", d, p);
        $finish;
    end
endmodule
