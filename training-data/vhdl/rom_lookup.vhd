library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_Lookup is
    Port ( clk      : in  STD_LOGIC;
           addr     : in  UNSIGNED(2 downto 0);
           data_out : out STD_LOGIC_VECTOR(7 downto 0));
end ROM_Lookup;

architecture Behavioral of ROM_Lookup is
    type rom_array is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
    constant mem : rom_array := (
        0 => x"0A",
        1 => x"14",
        2 => x"1E",
        3 => x"28",
        4 => x"32",
        5 => x"3C",
        6 => x"46",
        7 => x"50"
    );
begin
    process(clk)
    begin
        if rising_edge(clk) then
            data_out <= mem(to_integer(addr));
        end if;
    end process;
end Behavioral;
