library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mandelbrot_iter_count is
  port (clk, rst, start : in std_logic;
        cr, ci          : in signed(15 downto 0);  -- Q4.12
        iters           : out unsigned(5 downto 0);
        done            : out std_logic);
end entity;

architecture rtl of mandelbrot_iter_count is
  signal zr, zi : signed(15 downto 0) := (others => '0');
  signal n      : unsigned(5 downto 0) := (others => '0');
  signal busy   : std_logic := '0';
begin
  process (clk)
    variable zr2, zi2, zrzi : signed(31 downto 0);
  begin
    if rising_edge(clk) then
      done <= '0';
      if rst = '1' then
        busy <= '0';
      elsif start = '1' then
        zr <= (others => '0'); zi <= (others => '0'); n <= (others => '0'); busy <= '1';
      elsif busy = '1' then
        zr2 := zr * zr; zi2 := zi * zi; zrzi := zr * zi;
        if n = 30 or (zr2 + zi2) > to_signed(2 ** 26, 32) then
          busy <= '0'; done <= '1';
        else
          zr <= resize(shift_right(zr2 - zi2, 12), 16) + cr;
          zi <= resize(shift_right(zrzi, 11), 16) + ci;
          n  <= n + 1;
        end if;
      end if;
    end if;
  end process;
  iters <= n;
end architecture;
