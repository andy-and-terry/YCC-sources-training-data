module delannoy_cell #(
    parameter W = 16
) (
    input  wire [W-1:0] up,
    input  wire [W-1:0] left,
    input  wire [W-1:0] diag,
    output wire [W-1:0] out
);

// Delannoy recurrence: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
assign out = up + left + diag;

endmodule
