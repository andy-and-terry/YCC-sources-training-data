module primes_below_count;
    integer i, j, count;
    reg composite [0:99];

    initial begin
        for (i = 0; i < 100; i = i + 1) composite[i] = 0;
        count = 0;
        for (i = 2; i < 100; i = i + 1) begin
            if (!composite[i]) begin
                count = count + 1;
                for (j = i * i; j < 100; j = j + i) composite[j] = 1;
            end
        end
        $display("%0d", count);
    end
endmodule
