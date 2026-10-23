library ieee;
use ieee.std_logic_1164.all;

entity select_priority_decoder is
    port (
        req   : in  std_logic_vector(3 downto 0);
        grant : out std_logic_vector(1 downto 0);
        valid : out std_logic
    );
end entity;

architecture rtl of select_priority_decoder is
begin
    with req select
        grant <= "11" when "1---",
                 "10" when "01--",
                 "01" when "001-",
                 "00" when others;

    valid <= '0' when req = "0000" else '1';
end architecture;
