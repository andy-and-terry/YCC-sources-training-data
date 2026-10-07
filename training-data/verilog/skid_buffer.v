module skid_buffer #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire [WIDTH-1:0] data_in,
    input wire valid_in,
    output wire ready_out,
    output reg [WIDTH-1:0] data_out,
    output reg valid_out,
    input wire ready_in
);

reg [WIDTH-1:0] skid_reg;
reg skid_valid;

assign ready_out = !skid_valid;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        skid_reg <= {WIDTH{1'b0}};
        skid_valid <= 1'b0;
        data_out <= {WIDTH{1'b0}};
        valid_out <= 1'b0;
    end else if (valid_out && !ready_in) begin
        if (valid_in && ready_out) begin
            skid_reg <= data_in;
            skid_valid <= 1'b1;
        end
    end else begin
        if (skid_valid) begin
            data_out <= skid_reg;
            valid_out <= 1'b1;
            skid_valid <= 1'b0;
        end else begin
            data_out <= data_in;
            valid_out <= valid_in;
        end
    end
end

endmodule
