module detect101 (
    input clk, input rst, input x, output z
);
    localparam S0 = 0, S1 = 1, S2 = 2;
    reg [1:0] s;
    always @(posedge clk) begin
        if (rst) s <= S0;
        else case (s)
            S0: s <= x ? S1 : S0;
            S1: s <= x ? S1 : S2;
            S2: s <= x ? S1 : S0;
        endcase
    end
    assign z = (s == S2) && x;
endmodule
