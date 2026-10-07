library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_1bit_Slice is
    Port ( a, b, cin : in  STD_LOGIC;
           op         : in  STD_LOGIC_VECTOR(1 downto 0);
           result     : out STD_LOGIC;
           cout       : out STD_LOGIC);
end ALU_1bit_Slice;

architecture Behavioral of ALU_1bit_Slice is
begin
    process(a, b, cin, op)
    begin
        case op is
            when "00" =>
                result <= a xor b xor cin;
                cout   <= (a and b) or (a and cin) or (b and cin);
            when "01" =>
                result <= a and b;
                cout   <= '0';
            when "10" =>
                result <= a or b;
                cout   <= '0';
            when others =>
                result <= a xor b;
                cout   <= '0';
        end case;
    end process;
end Behavioral;
