module seq_detect_101 (
    input  wire clk, rst, x,
    output wire match
);
    localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2;
    reg [1:0] state;
    always @(posedge clk) begin
        if (rst) state <= S0;
        else case (state)
            S0: state <= x ? S1 : S0;
            S1: state <= x ? S1 : S2;
            S2: state <= x ? S1 : S0;
            default: state <= S0;
        endcase
    end
    assign match = (state == S2) && x;
endmodule
