library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
entity dec is port (a : in unsigned(2 downto 0); y : out std_logic_vector(7 downto 0)); end;
architecture rtl of dec is begin
  g : for i in 0 to 7 generate
    y(i) <= '1' when to_integer(a) = i else '0';
  end generate;
end;
