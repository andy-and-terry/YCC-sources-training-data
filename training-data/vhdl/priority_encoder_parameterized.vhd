library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Priority_Encoder_Parameterized is
    Generic ( WIDTH    : integer := 8;
              OUTWIDTH : integer := 3 );
    Port ( request : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           encoded : out STD_LOGIC_VECTOR(OUTWIDTH-1 downto 0);
           valid   : out STD_LOGIC);
end Priority_Encoder_Parameterized;

architecture Behavioral of Priority_Encoder_Parameterized is
begin
    process(request)
    begin
        encoded <= (others => '0');
        valid   <= '0';
        for i in 0 to WIDTH-1 loop
            if request(i) = '1' then
                encoded <= std_logic_vector(to_unsigned(i, OUTWIDTH));
                valid   <= '1';
            end if;
        end loop;
    end process;
end Behavioral;
