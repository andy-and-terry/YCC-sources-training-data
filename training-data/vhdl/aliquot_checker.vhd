library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Combinational perfect-number detector for n < 64 using a function.
entity Aliquot_Checker is
    Port ( n : in UNSIGNED(5 downto 0); perfect : out STD_LOGIC);
end Aliquot_Checker;

architecture Behavioral of Aliquot_Checker is
    function aliquot(v : natural) return natural is
        variable s : natural := 0;
    begin
        for d in 1 to 63 loop
            if d < v and v mod d = 0 then s := s + d; end if;
        end loop;
        return s;
    end function;
begin
    perfect <= '1' when to_integer(n) > 1 and aliquot(to_integer(n)) = to_integer(n) else '0';
end Behavioral;
