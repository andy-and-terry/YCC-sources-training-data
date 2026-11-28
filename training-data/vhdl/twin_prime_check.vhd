library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Twin_Prime_Check is
    Port ( n    : in  INTEGER range 0 to 61;
           twin : out STD_LOGIC);
end Twin_Prime_Check;

architecture Behavioral of Twin_Prime_Check is
    function is_prime (v : INTEGER) return BOOLEAN is
    begin
        if v < 2 then return FALSE; end if;
        for d in 2 to 7 loop
            if d < v and (v mod d) = 0 then return FALSE; end if;
        end loop;
        return TRUE;
    end function;
begin
    twin <= '1' when is_prime(n) and is_prime(n + 2) else '0';
end Behavioral;
