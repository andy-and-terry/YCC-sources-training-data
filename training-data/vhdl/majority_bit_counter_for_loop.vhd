library ieee;
use ieee.std_logic_1164.all;

entity ones_counter is
    port (
        din   : in  std_logic_vector(7 downto 0);
        count : out integer range 0 to 8
    );
end entity;

architecture rtl of ones_counter is
begin
    process (din)
        variable n : integer range 0 to 8;
    begin
        n := 0;
        for i in din'range loop
            if din(i) = '1' then
                n := n + 1;
            end if;
        end loop;
        count <= n;
    end process;
end architecture;
