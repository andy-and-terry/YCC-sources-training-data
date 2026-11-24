// Moser-de Bruijn sequence: binary digits of n read in base 4.
module moser_de_bruijn;
    integer n;

    function integer moser(input integer v);
        integer m, place, res;
        begin
            m = v; place = 1; res = 0;
            while (m > 0) begin
                if (m & 1) res = res + place;
                m = m >> 1;
                place = place * 4;
            end
            moser = res;
        end
    endfunction

    initial begin
        for (n = 0; n < 12; n = n + 1) $write("%0d ", moser(n));
        $display("");
        $finish;
    end
endmodule
