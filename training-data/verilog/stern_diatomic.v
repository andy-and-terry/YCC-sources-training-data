// Sequential Stern diatomic generator: emits s(0), s(1), s(2), ... one value per clock
module stern_diatomic (
    input  wire        clk,
    input  wire        rst,
    output reg  [15:0] value
);

reg [15:0] mem [0:63];
reg [5:0]  i;

always @(posedge clk) begin
    if (rst) begin
        mem[0] <= 16'd0;
        mem[1] <= 16'd1;
        i      <= 6'd0;
        value  <= 16'd0;
    end else begin
        value <= mem[i];
        if (i >= 2 && i < 62) begin
            if (i[0] == 1'b0)
                mem[i + 1] <= mem[(i + 1) >> 1];
            else
                mem[i + 1] <= mem[(i + 1) >> 1] + mem[((i + 1) >> 1) + 1];
        end
        i <= i + 6'd1;
    end
end

endmodule
