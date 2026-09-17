library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Array_Multiplier_4bit is
    Port ( a, b    : in  STD_LOGIC_VECTOR(3 downto 0);
           product : out STD_LOGIC_VECTOR(7 downto 0));
end Array_Multiplier_4bit;

architecture Behavioral of Array_Multiplier_4bit is
    signal pp0, pp1, pp2, pp3 : STD_LOGIC_VECTOR(3 downto 0);
begin
    pp0 <= a and (others => b(0));
    pp1 <= a and (others => b(1));
    pp2 <= a and (others => b(2));
    pp3 <= a and (others => b(3));

    product <= std_logic_vector(unsigned("0000" & pp0) +
                                 unsigned("000" & pp1 & '0') +
                                 unsigned("00" & pp2 & "00") +
                                 unsigned("0" & pp3 & "000"));
end Behavioral;
