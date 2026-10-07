library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- 16-entry sine table, 8-bit unsigned output centered at 128.
entity Sine_ROM_Lookup is
    Port ( clk    : in  STD_LOGIC;
           phase  : in  UNSIGNED(3 downto 0);
           sample : out UNSIGNED(7 downto 0));
end Sine_ROM_Lookup;

architecture Behavioral of Sine_ROM_Lookup is
    type rom_t is array (0 to 15) of integer range 0 to 255;
    constant ROM : rom_t := (128, 177, 218, 246, 255, 246, 218, 177,
                             128,  79,  38,  10,   1,  10,  38,  79);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            sample <= to_unsigned(ROM(to_integer(phase)), 8);
        end if;
    end process;
end Behavioral;
