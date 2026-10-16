module count_leading_ones (
    input wire [7:0] in,
    output reg [3:0] count
);

integer i;
reg stop;

always @(*) begin
    count = 4'd0;
    stop = 1'b0;
    for (i = 7; i >= 0; i = i - 1) begin
        if (!stop) begin
            if (in[i])
                count = count + 1'b1;
            else
                stop = 1'b1;
        end
    end
end

endmodule
