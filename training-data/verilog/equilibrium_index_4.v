// Finds the first position (0..3) where the sum on the left equals the sum on the right.
// index_valid is low when no such position exists.
module equilibrium_index_4 (
    input wire [7:0] x0, x1, x2, x3,
    output reg [1:0] index,
    output reg index_valid
);

wire [9:0] total = x0 + x1 + x2 + x3;
wire [9:0] left0 = 10'd0;
wire [9:0] left1 = x0;
wire [9:0] left2 = x0 + x1;
wire [9:0] left3 = x0 + x1 + x2;

always @(*) begin
    index_valid = 1'b1;
    index = 2'd0;
    if (left0 == total - left0 - x0) index = 2'd0;
    else if (left1 == total - left1 - x1) index = 2'd1;
    else if (left2 == total - left2 - x2) index = 2'd2;
    else if (left3 == total - left3 - x3) index = 2'd3;
    else index_valid = 1'b0;
end

endmodule
