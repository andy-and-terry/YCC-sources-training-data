library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sign_Extender is
    Generic ( IN_WIDTH  : integer := 8;
              OUT_WIDTH : integer := 16 );
    Port ( data_in   : in  STD_LOGIC_VECTOR(IN_WIDTH-1 downto 0);
           is_signed : in  STD_LOGIC;
           data_out  : out STD_LOGIC_VECTOR(OUT_WIDTH-1 downto 0));
end Sign_Extender;

architecture Behavioral of Sign_Extender is
begin
    process(data_in, is_signed)
    begin
        if is_signed = '1' then
            data_out <= std_logic_vector(resize(signed(data_in), OUT_WIDTH));
        else
            data_out <= std_logic_vector(resize(unsigned(data_in), OUT_WIDTH));
        end if;
    end process;
end Behavioral;
