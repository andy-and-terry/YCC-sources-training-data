library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder_ex is
  port (req : in std_logic_vector(3 downto 0); code : out std_logic_vector(1 downto 0); valid : out std_logic);
end entity;

architecture rtl of priority_encoder_ex is
begin
  valid <= '1' when req /= "0000" else '0';
  code <= "11" when req(3) = '1' else
          "10" when req(2) = '1' else
          "01" when req(1) = '1' else
          "00";
end architecture;
