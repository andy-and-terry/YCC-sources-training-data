module self_describing_numbers;
// digits digits 4 bits each, most significant digit first
function is_self_describing(input [19:0] digits, input integer len);
    integer i, j, count;
    reg ok;
    begin
        ok = 1;
        for (i = 0; i < len; i = i + 1) begin
            count = 0;
            for (j = 0; j < len; j = j + 1)
                if (digits[(len - 1 - j) * 4 +: 4] == i) count = count + 1;
            if (count != digits[(len - 1 - i) * 4 +: 4]) ok = 0;
        end
        is_self_describing = ok;
    end
endfunction

initial begin
    $display("1210 %0d", is_self_describing(20'h1210, 4));
    $display("2020 %0d", is_self_describing(20'h2020, 4));
    $display("21200 %0d", is_self_describing(20'h21200, 5));
    $display("1211 %0d", is_self_describing(20'h1211, 4));
end

endmodule
