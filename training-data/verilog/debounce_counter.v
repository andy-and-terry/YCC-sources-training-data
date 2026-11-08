module debounce #(parameter LIMIT = 4) (
    input wire clk,
    input wire noisy,
    output reg clean
);
    reg [2:0] cnt;
    always @(posedge clk) begin
        if (noisy == clean) cnt <= 0;
        else if (cnt == LIMIT - 1) begin clean <= noisy; cnt <= 0; end
        else cnt <= cnt + 1;
    end
endmodule
