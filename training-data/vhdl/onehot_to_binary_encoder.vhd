library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Onehot_To_Binary_Encoder is
    Port ( onehot_in  : in  STD_LOGIC_VECTOR(7 downto 0);
           binary_out : out STD_LOGIC_VECTOR(2 downto 0);
           valid      : out STD_LOGIC);
end Onehot_To_Binary_Encoder;

architecture Behavioral of Onehot_To_Binary_Encoder is
begin
    valid <= '0' when onehot_in = (onehot_in'range => '0') else '1';

    process(onehot_in)
    begin
        case onehot_in is
            when "10000000" => binary_out <= "111";
            when "01000000" => binary_out <= "110";
            when "00100000" => binary_out <= "101";
            when "00010000" => binary_out <= "100";
            when "00001000" => binary_out <= "011";
            when "00000100" => binary_out <= "010";
            when "00000010" => binary_out <= "001";
            when "00000001" => binary_out <= "000";
            when others     => binary_out <= "000";
        end case;
    end process;
end Behavioral;
