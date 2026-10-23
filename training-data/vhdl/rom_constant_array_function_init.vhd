library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity squares_rom is
    port (
        addr : in  unsigned(2 downto 0);
        data : out unsigned(7 downto 0)
    );
end entity;

architecture rtl of squares_rom is
    type rom_t is array (0 to 7) of unsigned(7 downto 0);

    function init_rom return rom_t is
        variable r : rom_t;
    begin
        for i in r'range loop
            r(i) := to_unsigned(i * i + 1, 8);
        end loop;
        return r;
    end function;

    constant ROM : rom_t := init_rom;
begin
    data <= ROM(to_integer(addr));
end architecture;
