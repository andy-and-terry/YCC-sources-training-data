library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Priority_Encoder_4to2 is
    Port ( din   : in  STD_LOGIC_VECTOR(3 downto 0);
           dout  : out STD_LOGIC_VECTOR(1 downto 0);
           valid : out STD_LOGIC);
end Priority_Encoder_4to2;

architecture Behavioral of Priority_Encoder_4to2 is
begin
    process(din)
    begin
        valid <= '1';
        if din(3) = '1' then
            dout <= "11";
        elsif din(2) = '1' then
            dout <= "10";
        elsif din(1) = '1' then
            dout <= "01";
        elsif din(0) = '1' then
            dout <= "00";
        else
            dout <= "00";
            valid <= '0';
        end if;
    end process;
end Behavioral;
