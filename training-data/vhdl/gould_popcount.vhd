library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gould_popcount is
    port (
        n     : in  std_logic_vector(3 downto 0);
        gould : out natural range 0 to 16
    );
end gould_popcount;

architecture Behavioral of gould_popcount is
begin
    process (n)
        variable ones : natural;
    begin
        ones := 0;
        for i in n'range loop
            if n(i) = '1' then ones := ones + 1; end if;
        end loop;
        gould <= 2 ** ones;
    end process;
end Behavioral;
