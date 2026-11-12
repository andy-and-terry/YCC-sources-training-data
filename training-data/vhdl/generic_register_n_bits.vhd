library ieee; use ieee.std_logic_1164.all;
entity reg_n is generic (N : natural := 8); port (clk, en : in std_logic; d : in std_logic_vector(N-1 downto 0); q : out std_logic_vector(N-1 downto 0)); end;
architecture rtl of reg_n is begin
  process (clk) begin if rising_edge(clk) and en = '1' then q <= d; end if; end process;
end;
