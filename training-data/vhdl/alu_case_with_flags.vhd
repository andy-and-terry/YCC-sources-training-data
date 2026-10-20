library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    port (a, b : in unsigned(7 downto 0);
          op : in std_logic_vector(2 downto 0);
          y : out unsigned(7 downto 0);
          zero : out std_logic);
end alu;

architecture rtl of alu is
    signal r : unsigned(7 downto 0);
begin
    process (a, b, op)
    begin
        case op is
            when "000" => r <= a + b;
            when "001" => r <= a - b;
            when "010" => r <= a and b;
            when "011" => r <= a or b;
            when "100" => r <= a xor b;
            when "101" => r <= shift_left(a, 1);
            when "110" => r <= shift_right(a, 1);
            when others => r <= not a;
        end case;
    end process;
    y <= r;
    zero <= '1' when r = 0 else '0';
end rtl;
