module pattern_window_matcher #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire valid,
    input wire [WIDTH-1:0] data_in,
    input wire [WIDTH-1:0] pattern,
    input wire [WIDTH-1:0] mask,
    output reg match,
    output reg [15:0] match_count
);

wire hit;

assign hit = ((data_in ^ pattern) & mask) == {WIDTH{1'b0}};

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        match <= 1'b0;
        match_count <= 16'd0;
    end else begin
        match <= valid & hit;
        if (valid & hit)
            match_count <= match_count + 1'b1;
    end
end

endmodule
