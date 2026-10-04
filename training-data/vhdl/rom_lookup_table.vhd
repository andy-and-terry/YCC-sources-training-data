library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom_lookup_table is
    port ( clk  : in  std_logic;
           addr : in  std_logic_vector(2 downto 0);
           data : out std_logic_vector(7 downto 0) );
end rom_lookup_table;

architecture Behavioral of rom_lookup_table is
    type rom_t is array (0 to 7) of std_logic_vector(7 downto 0);
    constant ROM : rom_t := (
        x"00", x"01", x"04", x"09", x"10", x"19", x"24", x"31"
    );
begin
    process(clk)
    begin
        if rising_edge(clk) then
            data <= ROM(to_integer(unsigned(addr)));
        end if;
    end process;
end Behavioral;
