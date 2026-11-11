-- Bulls and Cows: count positions where two 4-digit codes (4 bits per digit) match
library ieee;
use ieee.std_logic_1164.all;

entity bulls_counter is
  port (
    secret : in  std_logic_vector(15 downto 0);
    guess  : in  std_logic_vector(15 downto 0);
    bulls  : out natural range 0 to 4
  );
end entity;

architecture comb of bulls_counter is
begin
  process (secret, guess)
    variable c : natural range 0 to 4;
  begin
    c := 0;
    for i in 0 to 3 loop
      if secret(4 * i + 3 downto 4 * i) = guess(4 * i + 3 downto 4 * i) then
        c := c + 1;
      end if;
    end loop;
    bulls <= c;
  end process;
end architecture;
