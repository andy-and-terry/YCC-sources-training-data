library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Palindromic_Prime_Check is
    Port ( n : in  UNSIGNED(7 downto 0);
           result : out STD_LOGIC);
end Palindromic_Prime_Check;

architecture Behavioral of Palindromic_Prime_Check is
    function is_prime(x : integer) return boolean is
    begin
        if x < 2 then return false; end if;
        for i in 2 to 14 loop
            if i * i <= x and x mod i = 0 then return false; end if;
        end loop;
        return true;
    end function;
begin
    process(n)
        variable v : integer;
        variable pal : boolean;
    begin
        v := to_integer(n);
        if v < 10 then pal := true;
        elsif v < 100 then pal := (v / 10 = v mod 10);
        else pal := (v / 100 = v mod 10);
        end if;
        if pal and is_prime(v) then result <= '1'; else result <= '0'; end if;
    end process;
end Behavioral;
