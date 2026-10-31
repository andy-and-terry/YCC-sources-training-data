module multiplicative_persistence;
function integer persistence(input integer value);
    integer n, product;
    begin
        n = value;
        persistence = 0;
        while (n >= 10) begin
            product = 1;
            while (n > 0) begin
                product = product * (n % 10);
                n = n / 10;
            end
            n = product;
            persistence = persistence + 1;
        end
    end
endfunction

initial begin
    $display("39 %0d", persistence(39));
    $display("77 %0d", persistence(77));
    $display("999 %0d", persistence(999));
    $display("10 %0d", persistence(10));
end

endmodule
