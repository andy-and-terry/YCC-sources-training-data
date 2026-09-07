module leading_zero_counter #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] data_in,
    output reg [$clog2(WIDTH+1)-1:0] lz_count,
    output wire all_zero
);

integer i;

always @(*) begin
    lz_count = WIDTH;
    for (i = WIDTH - 1; i >= 0; i = i - 1) begin
        if (data_in[i] && (lz_count == WIDTH)) begin
            lz_count = WIDTH - 1 - i;
        end
    end
end

assign all_zero = ~(|data_in);

endmodule
