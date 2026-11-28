library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Emirp_Check is
    Port ( p : in  UNSIGNED(7 downto 0);
           is_emirp : out STD_LOGIC);
end Emirp_Check;

architecture Behavioral of Emirp_Check is
    function is_prime(x : integer) return boolean is
    begin
        if x < 2 then return false; end if;
        for i in 2 to 14 loop
            if i * i <= x and x mod i = 0 then return false; end if;
        end loop;
        return true;
    end function;
begin
    process(p)
        variable v, r : integer;
    begin
        v := to_integer(p);
        r := (v mod 10) * 100 + ((v / 10) mod 10) * 10 + (v / 100);
        if r /= v and is_prime(v) and is_prime(r) then
            is_emirp <= '1';
        else
            is_emirp <= '0';
        end if;
    end process;
end Behavioral;
