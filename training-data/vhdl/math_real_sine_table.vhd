library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- Builds a sine lookup table at elaboration time with MATH_REAL.
entity math_real_sine_table is
    Port ( clk  : in  STD_LOGIC;
           addr : in  unsigned(4 downto 0);
           data : out signed(7 downto 0));
end math_real_sine_table;

architecture Behavioral of math_real_sine_table is
    type rom_t is array (0 to 31) of signed(7 downto 0);

    function init_rom return rom_t is
        variable rom : rom_t;
        variable angle : real;
    begin
        for i in rom'range loop
            angle := 2.0 * MATH_PI * real(i) / 32.0;
            rom(i) := to_signed(integer(round(127.0 * sin(angle))), 8);
        end loop;
        return rom;
    end function;

    constant SINE_ROM : rom_t := init_rom;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            data <= SINE_ROM(to_integer(addr));
        end if;
    end process;
end Behavioral;
