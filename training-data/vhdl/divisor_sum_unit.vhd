-- Sum of proper divisors d(n) for small n; amicable pairs have d(a)=b and d(b)=a
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_sum_unit is
  port (
    n   : in  natural range 0 to 1023;
    sum : out natural range 0 to 4095
  );
end entity;

architecture comb of divisor_sum_unit is
begin
  process (n)
    variable s : natural range 0 to 4095;
  begin
    s := 0;
    for i in 1 to 1023 loop
      if i < n and (n mod i) = 0 then
        s := s + i;
      end if;
    end loop;
    sum <= s;
  end process;
end architecture;
