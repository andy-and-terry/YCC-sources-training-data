module debounce #(parameter N = 3) (input wire clk, rst, noisy, output reg clean, output wire rise, fall);
    reg [N-1:0] hist;
    reg prev;
    always @(posedge clk) begin
        if (rst) begin hist <= 0; clean <= 0; prev <= 0; end
        else begin
            hist <= {hist[N-2:0], noisy};
            if (&hist) clean <= 1'b1;
            else if (~|hist) clean <= 1'b0;
            prev <= clean;
        end
    end
    assign rise = clean & ~prev;
    assign fall = ~clean & prev;
endmodule
