module perfect_square_check (
    input  [7:0] n,
    output reg   is_square
);
    integer r;
    always @* begin
        is_square = 1'b0;
        for (r = 0; r < 16; r = r + 1)
            if (r * r == n) is_square = 1'b1;
    end
endmodule
