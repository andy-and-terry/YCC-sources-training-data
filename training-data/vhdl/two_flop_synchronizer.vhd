library ieee;
use ieee.std_logic_1164.all;

entity two_flop_synchronizer is
    port (
        clk      : in  std_logic;
        rst_n    : in  std_logic;
        async_in : in  std_logic;
        sync_out : out std_logic
    );
end entity;

architecture rtl of two_flop_synchronizer is
    signal meta, stable : std_logic := '0';
begin
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            meta   <= '0';
            stable <= '0';
        elsif rising_edge(clk) then
            meta   <= async_in;
            stable <= meta;
        end if;
    end process;

    sync_out <= stable;
end architecture;
