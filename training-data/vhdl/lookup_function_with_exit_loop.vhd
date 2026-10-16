library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Finds the position of the first set bit using exit inside a loop.
entity First_Set_Bit is
    Port ( data  : in  STD_LOGIC_VECTOR(7 downto 0);
           index : out unsigned(2 downto 0);
           found : out STD_LOGIC);
end First_Set_Bit;

architecture Behavioral of First_Set_Bit is
begin
    process(data)
        variable idx : integer range 0 to 7;
        variable hit : boolean;
    begin
        idx := 0; hit := false;
        for i in 0 to 7 loop
            if data(i) = '1' then
                idx := i; hit := true;
                exit;
            end if;
        end loop;
        index <= to_unsigned(idx, 3);
        if hit then found <= '1'; else found <= '0'; end if;
    end process;
end Behavioral;
