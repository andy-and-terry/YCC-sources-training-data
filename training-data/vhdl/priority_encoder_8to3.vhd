library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Priority_Encoder_8to3 is
    Port ( din   : in  STD_LOGIC_VECTOR(7 downto 0);
           dout  : out STD_LOGIC_VECTOR(2 downto 0);
           valid : out STD_LOGIC);
end Priority_Encoder_8to3;

architecture Behavioral of Priority_Encoder_8to3 is
begin
    process(din)
    begin
        valid <= '1';
        if din(7) = '1' then
            dout <= "111";
        elsif din(6) = '1' then
            dout <= "110";
        elsif din(5) = '1' then
            dout <= "101";
        elsif din(4) = '1' then
            dout <= "100";
        elsif din(3) = '1' then
            dout <= "011";
        elsif din(2) = '1' then
            dout <= "010";
        elsif din(1) = '1' then
            dout <= "001";
        elsif din(0) = '1' then
            dout <= "000";
        else
            dout <= "000";
            valid <= '0';
        end if;
    end process;
end Behavioral;
