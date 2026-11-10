module delannoy_numbers;
    integer g [0:5][0:5];
    integer i, j;
    initial begin
        for (i = 0; i <= 5; i = i + 1)
            for (j = 0; j <= 5; j = j + 1)
                if (i == 0 || j == 0) g[i][j] = 1;
                else g[i][j] = g[i-1][j] + g[i][j-1] + g[i-1][j-1];
        for (i = 0; i <= 5; i = i + 1) $write("%0d ", g[i][i]);
        $write("\n");  // 1 3 13 63 321 1683
    end
endmodule
