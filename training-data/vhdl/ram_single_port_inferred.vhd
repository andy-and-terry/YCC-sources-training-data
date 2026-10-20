library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram_sp is
    generic (AW : natural := 4; DW : natural := 8);
    port (clk, we : in std_logic;
          addr : in unsigned(AW - 1 downto 0);
          din : in std_logic_vector(DW - 1 downto 0);
          dout : out std_logic_vector(DW - 1 downto 0));
end ram_sp;

architecture rtl of ram_sp is
    type ram_t is array (0 to 2 ** AW - 1) of std_logic_vector(DW - 1 downto 0);
    signal ram : ram_t := (others => (others => '0'));
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram(to_integer(addr)) <= din;
            end if;
            dout <= ram(to_integer(addr));
        end if;
    end process;
end rtl;
