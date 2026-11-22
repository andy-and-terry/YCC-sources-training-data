// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
module euler_zigzag_numbers;
    integer row [0:15];
    integer nxt [0:15];
    integer i, j, len;

    initial begin
        row[0] = 1;
        len = 1;
        $write("1 ");
        for (i = 0; i < 9; i = i + 1) begin
            nxt[0] = 0;
            for (j = 1; j <= len; j = j + 1)
                nxt[j] = nxt[j - 1] + row[len - j];
            len = len + 1;
            for (j = 0; j < len; j = j + 1) row[j] = nxt[j];
            $write("%0d ", row[len - 1]);
        end
        $write("\n");
        $finish;
    end
endmodule
