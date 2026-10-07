module width_converter_8to16 (
    input wire clk,
    input wire rst_n,
    input wire in_valid,
    input wire [7:0] in_data,
    output reg out_valid,
    output reg [15:0] out_data
);

reg have_low;
reg [7:0] low_byte;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        have_low <= 1'b0;
        low_byte <= 8'd0;
        out_valid <= 1'b0;
        out_data <= 16'd0;
    end else begin
        out_valid <= 1'b0;
        if (in_valid) begin
            if (!have_low) begin
                low_byte <= in_data;
                have_low <= 1'b1;
            end else begin
                out_data <= {in_data, low_byte};
                out_valid <= 1'b1;
                have_low <= 1'b0;
            end
        end
    end
end

endmodule
