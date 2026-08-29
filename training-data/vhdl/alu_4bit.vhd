library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_4bit is
    Port ( a, b   : in  STD_LOGIC_VECTOR(3 downto 0);
           op     : in  STD_LOGIC_VECTOR(2 downto 0);
           result : out STD_LOGIC_VECTOR(3 downto 0);
           zero   : out STD_LOGIC);
end ALU_4bit;

architecture Behavioral of ALU_4bit is
    signal res : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(a, b, op)
    begin
        case op is
            when "000" => res <= a + b;
            when "001" => res <= a - b;
            when "010" => res <= a and b;
            when "011" => res <= a or b;
            when "100" => res <= a xor b;
            when "101" => res <= not a;
            when others => res <= "0000";
        end case;
    end process;
    result <= res;
    zero <= '1' when res = "0000" else '0';
end Behavioral;
