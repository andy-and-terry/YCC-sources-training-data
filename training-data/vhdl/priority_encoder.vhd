library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder is
  port (req   : in  std_logic_vector(7 downto 0);
        index : out integer range 0 to 7;
        valid : out std_logic);
end entity;

architecture rtl of priority_encoder is
begin
  process (req)
  begin
    index <= 0;
    valid <= '0';
    for i in 0 to 7 loop      -- last (highest) match wins
      if req(i) = '1' then
        index <= i;
        valid <= '1';
      end if;
    end loop;
  end process;
end architecture;
