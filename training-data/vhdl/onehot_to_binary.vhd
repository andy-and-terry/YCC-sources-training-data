library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity onehot_to_binary is
  port (onehot : in std_logic_vector(7 downto 0);
        bin    : out std_logic_vector(2 downto 0));
end entity;

architecture rtl of onehot_to_binary is
begin
  process (onehot)
    variable r : natural range 0 to 7;
  begin
    r := 0;
    for i in onehot'range loop
      if onehot(i) = '1' then r := i; end if;
    end loop;
    bin <= std_logic_vector(to_unsigned(r, 3));
  end process;
end architecture;
