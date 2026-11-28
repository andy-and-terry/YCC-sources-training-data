module block_sum_accumulator #(parameter BS = 4) (
    input  wire        clk, rst, valid,
    input  wire [7:0]  data,
    output reg  [11:0] block_sum,
    output reg         block_done
);
    reg [$clog2(BS):0] cnt;
    always @(posedge clk) begin
        block_done <= 0;
        if (rst) begin cnt <= 0; block_sum <= 0; end
        else if (valid) begin
            if (cnt == BS - 1) begin
                block_sum <= block_sum + data; cnt <= 0; block_done <= 1;
            end else begin
                block_sum <= (cnt == 0) ? data : block_sum + data; cnt <= cnt + 1;
            end
        end
    end
endmodule
