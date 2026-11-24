-- Aliquot sequence: replace n by the sum of its proper divisors.
entity aliquot_sequence is
end entity;

architecture sim of aliquot_sequence is
    function aliquot_sum(n : natural) return natural is
        variable s : natural := 0;
    begin
        for d in 1 to n / 2 loop
            if n mod d = 0 then
                s := s + d;
            end if;
        end loop;
        return s;
    end function;
begin
    process
        variable n     : natural := 12;
        variable count : natural := 0;
    begin
        report integer'image(n);
        while n > 1 and count < 19 loop
            n := aliquot_sum(n);
            report integer'image(n);
            count := count + 1;
        end loop;
        wait;
    end process;
end architecture;
