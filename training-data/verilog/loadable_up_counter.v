module loadable_up_counter #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire load,
    input wire en,
    input wire [WIDTH-1:0] load_value,
    output reg [WIDTH-1:0] count,
    output wire terminal_count
);

assign terminal_count = (count == {WIDTH{1'b1}});

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= {WIDTH{1'b0}};
    end else if (load) begin
        count <= load_value;
    end else if (en) begin
        count <= count + 1'b1;
    end
end

endmodule
