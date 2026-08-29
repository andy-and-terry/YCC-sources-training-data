module synchronous_counter_up_down (
    input wire clk,
    input wire rst_n,
    input wire up_down,
    output reg [3:0] count
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 4'b0000;
    end else if (up_down) begin
        count <= count + 1'b1;
    end else begin
        count <= count - 1'b1;
    end
end

endmodule
