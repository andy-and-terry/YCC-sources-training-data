module clk_div #(parameter DIV = 4) (input wire clk, rst, output reg tick, output reg slow);
    localparam CW = $clog2(DIV);
    reg [CW-1:0] cnt;
    always @(posedge clk or posedge rst) begin
        if (rst) begin cnt <= 0; tick <= 0; slow <= 0; end
        else if (cnt == DIV - 1) begin cnt <= 0; tick <= 1; slow <= ~slow; end
        else begin cnt <= cnt + 1; tick <= 0; end
    end
endmodule
