library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Synchronous_Counter_Up_Down is
    Port ( clk, rst_n, up_down : in  STD_LOGIC;
           count                : out STD_LOGIC_VECTOR(3 downto 0));
end Synchronous_Counter_Up_Down;

architecture Behavioral of Synchronous_Counter_Up_Down is
    signal count_internal : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count_internal <= "0000";
        elsif rising_edge(clk) then
            if up_down = '1' then
                count_internal <= count_internal + 1;
            else
                count_internal <= count_internal - 1;
            end if;
        end if;
    end process;
    count <= count_internal;
end Behavioral;
