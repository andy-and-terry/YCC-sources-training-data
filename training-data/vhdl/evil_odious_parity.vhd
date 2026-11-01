-- Evil numbers have an even number of 1 bits; the XOR reduction gives parity.
library ieee;
use ieee.std_logic_1164.all;

entity evil_odious_parity is
    port (
        value   : in  std_logic_vector(7 downto 0);
        is_evil : out std_logic
    );
end entity;

architecture rtl of evil_odious_parity is
begin
    process (value)
        variable parity : std_logic;
    begin
        parity := '0';
        for i in value'range loop
            parity := parity xor value(i);
        end loop;
        is_evil <= not parity;
    end process;
end architecture;
