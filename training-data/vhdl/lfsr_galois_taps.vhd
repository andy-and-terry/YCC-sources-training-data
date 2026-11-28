library ieee;
use ieee.std_logic_1164.all;

entity lfsr_galois_taps is
  port (clk, rst : in std_logic;
        q        : out std_logic_vector(15 downto 0));
end entity;

architecture rtl of lfsr_galois_taps is
  signal r : std_logic_vector(15 downto 0) := x"ACE1";
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        r <= x"ACE1";
      elsif r(0) = '1' then
        r <= ('0' & r(15 downto 1)) xor x"B400";
      else
        r <= '0' & r(15 downto 1);
      end if;
    end if;
  end process;
  q <= r;
end architecture;
