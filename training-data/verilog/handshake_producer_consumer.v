module handshake_producer_consumer (
    input wire clk,
    input wire rst_n,
    input wire valid_in,
    output wire ready_out,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg data_valid
);

assign ready_out = 1'b1;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_out <= 8'b0;
        data_valid <= 1'b0;
    end else if (valid_in && ready_out) begin
        data_out <= data_in;
        data_valid <= 1'b1;
    end else begin
        data_valid <= 1'b0;
    end
end

endmodule
