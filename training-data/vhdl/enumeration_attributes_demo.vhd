library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uses 'succ, 'pred, 'left, 'right, 'pos and 'val on an enumeration type.
entity Enum_Attributes_Demo is
    Port ( clk, rst_n : in STD_LOGIC;
           pos_out    : out integer range 0 to 5);
end Enum_Attributes_Demo;

architecture Behavioral of Enum_Attributes_Demo is
    type color_t is (RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET);
    signal cur : color_t := color_t'left;
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            cur <= color_t'left;
        elsif rising_edge(clk) then
            if cur = color_t'right then
                cur <= color_t'left;
            else
                cur <= color_t'succ(cur);
            end if;
        end if;
    end process;
    pos_out <= color_t'pos(cur);
end Behavioral;
