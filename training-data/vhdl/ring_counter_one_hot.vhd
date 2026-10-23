library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ring_Counter_One_Hot is
    Port ( clk, rst : in  STD_LOGIC;
           q        : out STD_LOGIC_VECTOR(3 downto 0));
end Ring_Counter_One_Hot;

architecture Behavioral of Ring_Counter_One_Hot is
    signal state : STD_LOGIC_VECTOR(3 downto 0) := "0001";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            state <= "0001";
        elsif rising_edge(clk) then
            state <= state(2 downto 0) & state(3);
        end if;
    end process;
    q <= state;
end Behavioral;
