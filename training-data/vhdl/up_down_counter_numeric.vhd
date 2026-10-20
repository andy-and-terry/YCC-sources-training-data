library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity updown_counter is
    generic (W : natural := 4);
    port (clk, rst_n, up, load : in std_logic;
          load_val : in unsigned(W - 1 downto 0);
          count : out unsigned(W - 1 downto 0);
          at_max : out std_logic);
end updown_counter;

architecture rtl of updown_counter is
    signal c : unsigned(W - 1 downto 0);
begin
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            c <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then c <= load_val;
            elsif up = '1' then c <= c + 1;
            else c <= c - 1;
            end if;
        end if;
    end process;
    count <= c;
    at_max <= '1' when c = (c'range => '1') else '0';
end rtl;
