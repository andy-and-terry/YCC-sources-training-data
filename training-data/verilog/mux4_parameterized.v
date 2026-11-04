module mux4 #(parameter W = 8) (
    input  wire [W-1:0] d0, d1, d2, d3,
    input  wire [1:0]   sel,
    output reg  [W-1:0] y
);
    always @* begin
        case (sel)
            2'd0: y = d0;
            2'd1: y = d1;
            2'd2: y = d2;
            default: y = d3;
        endcase
    end
endmodule
