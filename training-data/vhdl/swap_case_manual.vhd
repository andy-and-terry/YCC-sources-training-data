library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity swap_case_manual is
  port (
    ch      : in  std_logic_vector(7 downto 0);
    swapped : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of swap_case_manual is
begin
  process (ch)
    variable v : unsigned(7 downto 0);
  begin
    v := unsigned(ch);
    if v >= 65 and v <= 90 then
      swapped <= std_logic_vector(v + 32);
    elsif v >= 97 and v <= 122 then
      swapped <= std_logic_vector(v - 32);
    else
      swapped <= ch;
    end if;
  end process;
end architecture;
