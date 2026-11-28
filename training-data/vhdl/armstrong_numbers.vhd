library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Armstrong_Check is
    Port ( n : in  UNSIGNED(9 downto 0);
           is_armstrong : out STD_LOGIC);
end Armstrong_Check;

architecture Behavioral of Armstrong_Check is
begin
    process(n)
        variable v, h, t, o : integer;
    begin
        v := to_integer(n);
        h := v / 100;
        t := (v / 10) mod 10;
        o := v mod 10;
        if v >= 100 and (h**3 + t**3 + o**3) = v then
            is_armstrong <= '1';
        else
            is_armstrong <= '0';
        end if;
    end process;
end Behavioral;
