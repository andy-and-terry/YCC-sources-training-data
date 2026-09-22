module trailing_zero_counter #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] data_in,
    output reg [$clog2(WIDTH+1)-1:0] tz_count,
    output wire all_zero
);

integer i;

always @(*) begin
    tz_count = WIDTH;
    for (i = 0; i < WIDTH; i = i + 1) begin
        if (data_in[i] && (tz_count == WIDTH)) begin
            tz_count = i;
        end
    end
end

assign all_zero = ~(|data_in);

endmodule
