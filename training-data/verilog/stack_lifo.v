module stack_lifo #(
    parameter DEPTH = 4,
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire push,
    input wire pop,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output wire full,
    output wire empty
);

reg [WIDTH-1:0] mem [0:DEPTH-1];
reg [$clog2(DEPTH):0] sp;

assign full = (sp == DEPTH);
assign empty = (sp == 0);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sp <= 0;
    end else if (push && !full) begin
        mem[sp] <= data_in;
        sp <= sp + 1;
    end else if (pop && !empty) begin
        data_out <= mem[sp - 1];
        sp <= sp - 1;
    end
end

endmodule
