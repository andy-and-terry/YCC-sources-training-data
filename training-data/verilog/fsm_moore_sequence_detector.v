module seq_detect_1011 (input wire clk, rst, x, output wire z);
    localparam S0 = 2'd0, S1 = 2'd1, S10 = 2'd2, S101 = 2'd3;
    reg [1:0] state, next;
    always @(posedge clk or posedge rst)
        if (rst) state <= S0; else state <= next;
    always @* begin
        case (state)
            S0:   next = x ? S1 : S0;
            S1:   next = x ? S1 : S10;
            S10:  next = x ? S101 : S0;
            S101: next = x ? S1 : S10;
            default: next = S0;
        endcase
    end
    reg hit;
    always @(posedge clk) hit <= (state == S101) && x;
    assign z = hit;
endmodule
