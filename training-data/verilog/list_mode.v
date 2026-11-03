module list_mode;
    integer items [0:5];
    integer counts [0:9];
    integer i, top;

    initial begin
        items[0] = 1; items[1] = 2; items[2] = 2;
        items[3] = 3; items[4] = 3; items[5] = 4;
        for (i = 0; i < 10; i = i + 1) counts[i] = 0;
        top = 0;
        for (i = 0; i < 6; i = i + 1) begin
            counts[items[i]] = counts[items[i]] + 1;
            if (counts[items[i]] > top) top = counts[items[i]];
        end
        for (i = 0; i < 10; i = i + 1)
            if (counts[i] == top) $write("%0d ", i);
        $display("");
    end
endmodule
