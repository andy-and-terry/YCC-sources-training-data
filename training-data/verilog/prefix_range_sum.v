module prefix_range_sum;
    integer values [0:7];
    integer prefix [0:8];
    integer i;

    initial begin
        values[0] = 3; values[1] = 1; values[2] = 4; values[3] = 1;
        values[4] = 5; values[5] = 9; values[6] = 2; values[7] = 6;
        prefix[0] = 0;
        for (i = 0; i < 8; i = i + 1) prefix[i + 1] = prefix[i] + values[i];
        $display("%0d", prefix[5] - prefix[2]);
    end
endmodule
