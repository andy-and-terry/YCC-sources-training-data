// Pass a byte stream through only when it differs from the previous byte.
module dedupe_adjacent_filter (
    input  wire       clk, rst, in_valid,
    input  wire [7:0] in_data,
    output reg        out_valid,
    output reg  [7:0] out_data
);
    reg [7:0] prev;
    reg       have_prev;
    always @(posedge clk) begin
        out_valid <= 1'b0;
        if (rst) have_prev <= 1'b0;
        else if (in_valid) begin
            if (!have_prev || in_data != prev) begin
                out_valid <= 1'b1;
                out_data  <= in_data;
            end
            prev <= in_data;
            have_prev <= 1'b1;
        end
    end
endmodule
