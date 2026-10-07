library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_Subtractor is
    Port ( a    : in  STD_LOGIC_VECTOR(3 downto 0);
           b    : in  STD_LOGIC_VECTOR(3 downto 0);
           bin  : in  STD_LOGIC;
           diff : out STD_LOGIC_VECTOR(3 downto 0);
           bout : out STD_LOGIC);
end BCD_Subtractor;

architecture Behavioral of BCD_Subtractor is
begin
    process(a, b, bin)
        variable raw_diff : integer;
    begin
        raw_diff := to_integer(unsigned(a)) - to_integer(unsigned(b)) - to_integer(unsigned'(""&bin));
        if raw_diff < 0 then
            diff <= std_logic_vector(to_unsigned(raw_diff + 10, 4));
            bout <= '1';
        else
            diff <= std_logic_vector(to_unsigned(raw_diff, 4));
            bout <= '0';
        end if;
    end process;
end Behavioral;
