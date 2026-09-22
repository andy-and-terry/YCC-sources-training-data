library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Bcd_Up_Counter is
    Port ( clk       : in  STD_LOGIC;
           rst_n     : in  STD_LOGIC;
           en        : in  STD_LOGIC;
           bcd       : out STD_LOGIC_VECTOR(3 downto 0);
           carry_out : out STD_LOGIC);
end Bcd_Up_Counter;

architecture Behavioral of Bcd_Up_Counter is
    signal bcd_internal : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    carry_out <= '1' when (bcd_internal = "1001" and en = '1') else '0';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            bcd_internal <= "0000";
        elsif rising_edge(clk) then
            if en = '1' then
                if bcd_internal = "1001" then
                    bcd_internal <= "0000";
                else
                    bcd_internal <= bcd_internal + 1;
                end if;
            end if;
        end if;
    end process;

    bcd <= bcd_internal;
end Behavioral;
