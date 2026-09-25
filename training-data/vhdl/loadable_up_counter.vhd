library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Loadable_Up_Counter is
    Port ( clk, rst_n, load, en : in  STD_LOGIC;
           data_in               : in  STD_LOGIC_VECTOR(3 downto 0);
           count                 : out STD_LOGIC_VECTOR(3 downto 0));
end Loadable_Up_Counter;

architecture Behavioral of Loadable_Up_Counter is
    signal count_internal : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            count_internal <= "0000";
        elsif rising_edge(clk) then
            if load = '1' then
                count_internal <= data_in;
            elsif en = '1' then
                count_internal <= count_internal + 1;
            end if;
        end if;
    end process;

    count <= count_internal;
end Behavioral;
