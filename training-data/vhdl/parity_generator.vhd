library ieee;
use ieee.std_logic_1164.all;

entity parity_generator is
  generic (W : positive := 8);
  port (data : in std_logic_vector(W-1 downto 0);
        even_parity : out std_logic);
end entity;

architecture rtl of parity_generator is
begin
  process (data)
    variable p : std_logic;
  begin
    p := '0';
    for i in data'range loop
      p := p xor data(i);
    end loop;
    even_parity <= p;
  end process;
end architecture;
