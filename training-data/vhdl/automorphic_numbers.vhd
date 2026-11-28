library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Automorphic_Check is
    Port ( n : in  UNSIGNED(9 downto 0);
           is_automorphic : out STD_LOGIC);
end Automorphic_Check;

architecture Behavioral of Automorphic_Check is
begin
    process(n)
        variable v, modulus : integer;
    begin
        v := to_integer(n);
        if v < 10 then modulus := 10;
        elsif v < 100 then modulus := 100;
        else modulus := 1000;
        end if;
        if (v * v) mod modulus = v then
            is_automorphic <= '1';
        else
            is_automorphic <= '0';
        end if;
    end process;
end Behavioral;
