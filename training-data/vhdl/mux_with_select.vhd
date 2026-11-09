library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
  port (sel : in std_logic_vector(1 downto 0); d : in std_logic_vector(3 downto 0); y : out std_logic);
end entity;

architecture rtl of mux4 is
begin
  with sel select
    y <= d(0) when "00",
         d(1) when "01",
         d(2) when "10",
         d(3) when others;
end architecture;
