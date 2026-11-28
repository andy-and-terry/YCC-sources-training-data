library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity block_sum_accumulator is
  generic (BS : positive := 4);
  port (clk, rst, valid : in std_logic;
        data            : in unsigned(7 downto 0);
        block_sum       : out unsigned(11 downto 0);
        block_done      : out std_logic);
end entity;

architecture rtl of block_sum_accumulator is
  signal cnt : natural range 0 to BS - 1 := 0;
  signal acc : unsigned(11 downto 0) := (others => '0');
begin
  process (clk)
  begin
    if rising_edge(clk) then
      block_done <= '0';
      if rst = '1' then
        cnt <= 0; acc <= (others => '0');
      elsif valid = '1' then
        if cnt = BS - 1 then
          block_sum <= acc + data; block_done <= '1';
          acc <= (others => '0'); cnt <= 0;
        else
          acc <= acc + data; cnt <= cnt + 1;
        end if;
      end if;
    end if;
  end process;
end architecture;
