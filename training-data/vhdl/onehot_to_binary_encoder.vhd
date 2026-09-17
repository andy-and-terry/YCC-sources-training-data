library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Onehot_To_Binary_Encoder is
    Port ( onehot_in  : in  STD_LOGIC_VECTOR(7 downto 0);
           binary_out : out STD_LOGIC_VECTOR(2 downto 0);
           valid      : out STD_LOGIC);
end Onehot_To_Binary_Encoder;

architecture Behavioral of Onehot_To_Binary_Encoder is
begin
    valid <= '1' when onehot_in /= "00000000" else '0';

    process(onehot_in)
    begin
        if    onehot_in(7) = '1' then binary_out <= "111";
        elsif onehot_in(6) = '1' then binary_out <= "110";
        elsif onehot_in(5) = '1' then binary_out <= "101";
        elsif onehot_in(4) = '1' then binary_out <= "100";
        elsif onehot_in(3) = '1' then binary_out <= "011";
        elsif onehot_in(2) = '1' then binary_out <= "010";
        elsif onehot_in(1) = '1' then binary_out <= "001";
        elsif onehot_in(0) = '1' then binary_out <= "000";
        else                          binary_out <= "000";
        end if;
    end process;
end Behavioral;
