library ieee; use ieee.std_logic_1164.all;
entity tri is port (d : in std_logic_vector(7 downto 0); oe : in std_logic; bus_o : out std_logic_vector(7 downto 0)); end;
architecture rtl of tri is begin
  bus_o <= d when oe = '1' else (others => 'Z');
end;
