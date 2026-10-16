library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Opcode decoder; unused opcodes use the null statement.
entity Null_Case_Demo is
    Port ( op : in  STD_LOGIC_VECTOR(1 downto 0);
           a, b : in unsigned(7 downto 0);
           y : out unsigned(7 downto 0));
end Null_Case_Demo;

architecture Behavioral of Null_Case_Demo is
begin
    process(op, a, b)
    begin
        y <= (others => '0');
        case op is
            when "00" => y <= a + b;
            when "01" => y <= a - b;
            when "10" => null;
            when others => y <= a and b;
        end case;
    end process;
end Behavioral;
