library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Leading_Zero_Counter is
    Generic ( WIDTH : integer := 8 );
    Port ( data_in  : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           lz_count : out integer range 0 to WIDTH;
           all_zero : out STD_LOGIC);
end Leading_Zero_Counter;

architecture Behavioral of Leading_Zero_Counter is
begin
    process(data_in)
        variable found : boolean;
    begin
        found := false;
        lz_count <= WIDTH;
        for i in WIDTH-1 downto 0 loop
            if data_in(i) = '1' and not found then
                lz_count <= WIDTH - 1 - i;
                found := true;
            end if;
        end loop;
    end process;
    all_zero <= '1' when data_in = (data_in'range => '0') else '0';
end Behavioral;
