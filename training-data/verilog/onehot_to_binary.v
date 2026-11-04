module onehot_to_binary (
    input  wire [7:0] onehot,
    output reg  [2:0] bin
);
    integer i;
    always @* begin
        bin = 3'd0;
        for (i = 0; i < 8; i = i + 1)
            if (onehot[i]) bin = i[2:0];
    end
endmodule
