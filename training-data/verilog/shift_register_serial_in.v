module shift_reg #(parameter N = 8) (
    input  wire clk,
    input  wire rst,
    input  wire en,
    input  wire din,
    output wire [N-1:0] q
);
    reg [N-1:0] r;
    always @(posedge clk or posedge rst) begin
        if (rst)      r <= {N{1'b0}};
        else if (en)  r <= {r[N-2:0], din};
    end
    assign q = r;
endmodule
