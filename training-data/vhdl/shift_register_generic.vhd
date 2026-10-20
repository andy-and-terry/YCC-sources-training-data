library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg is
    generic (N : positive := 8);
    port (clk, rst, en, din : in std_logic;
          q : out std_logic_vector(N - 1 downto 0));
end shift_reg;

architecture rtl of shift_reg is
    signal r : std_logic_vector(N - 1 downto 0) := (others => '0');
begin
    process (clk, rst)
    begin
        if rst = '1' then
            r <= (others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                r <= r(N - 2 downto 0) & din;
            end if;
        end if;
    end process;
    q <= r;
end rtl;
