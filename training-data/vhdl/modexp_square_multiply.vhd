-- Modular exponentiation by square-and-multiply: result = base^exp mod m
-- (the core of a Fermat primality test with base 2)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modexp_square_multiply is
  port (
    base   : in  natural range 0 to 65535;
    exp    : in  unsigned(15 downto 0);
    m      : in  positive range 1 to 65535;
    result : out natural range 0 to 65535
  );
end entity;

architecture comb of modexp_square_multiply is
begin
  process (base, exp, m)
    variable b, r : natural range 0 to 65535;
  begin
    b := base mod m;
    r := 1 mod m;
    for i in 0 to 15 loop
      if exp(i) = '1' then
        r := (r * b) mod m;
      end if;
      b := (b * b) mod m;
    end loop;
    result <= r;
  end process;
end architecture;
