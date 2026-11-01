library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom_lookup_ex is
  port (addr : in unsigned(1 downto 0); data : out std_logic_vector(7 downto 0));
end entity;

architecture rtl of rom_lookup_ex is
  type rom_t is array (0 to 3) of std_logic_vector(7 downto 0);
  constant ROM : rom_t := (x"3F", x"06", x"5B", x"4F");
begin
  data <= ROM(to_integer(addr));
end architecture;
