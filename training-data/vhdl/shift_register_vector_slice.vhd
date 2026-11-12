library ieee; use ieee.std_logic_1164.all;
entity sr is port (clk, din : in std_logic; q : out std_logic_vector(3 downto 0)); end;
architecture rtl of sr is signal r : std_logic_vector(3 downto 0) := "0000";
begin
  process (clk) begin if rising_edge(clk) then r <= r(2 downto 0) & din; end if; end process;
  q <= r;
end;
