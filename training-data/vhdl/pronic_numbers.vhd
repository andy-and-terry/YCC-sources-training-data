library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Emits n*(n+1) for n = 0, 1, 2, ... on each clock edge
entity Pronic_Generator is
    Port ( clk   : in  STD_LOGIC;
           rst   : in  STD_LOGIC;
           value : out UNSIGNED(15 downto 0));
end Pronic_Generator;

architecture Behavioral of Pronic_Generator is
    signal n : unsigned(7 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                n <= (others => '0');
                value <= (others => '0');
            else
                value <= resize(n * (n + 1), 16);
                n <= n + 1;
            end if;
        end if;
    end process;
end Behavioral;
