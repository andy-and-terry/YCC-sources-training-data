module counter_mod_n #(parameter N = 10, W = 4) (
    input  wire clk,
    input  wire rst,
    output reg [W-1:0] count
);
    always @(posedge clk) begin
        if (rst || count == N - 1) count <= 0;
        else count <= count + 1;
    end
endmodule
