library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Booth_Multiplier_4bit is
    Port ( multiplicand : in  STD_LOGIC_VECTOR(3 downto 0);
           multiplier   : in  STD_LOGIC_VECTOR(3 downto 0);
           product      : out STD_LOGIC_VECTOR(7 downto 0));
end Booth_Multiplier_4bit;

architecture Behavioral of Booth_Multiplier_4bit is
begin
    process(multiplicand, multiplier)
        variable acc_q_q1 : signed(8 downto 0);
        variable m_ext    : signed(3 downto 0);
    begin
        m_ext := signed(multiplicand);
        acc_q_q1 := (others => '0');
        acc_q_q1(4 downto 1) := signed(multiplier);
        for i in 0 to 3 loop
            case acc_q_q1(1 downto 0) is
                when "01" =>
                    acc_q_q1(8 downto 5) := acc_q_q1(8 downto 5) + m_ext;
                when "10" =>
                    acc_q_q1(8 downto 5) := acc_q_q1(8 downto 5) - m_ext;
                when others =>
                    null;
            end case;
            acc_q_q1 := shift_right(acc_q_q1, 1);
        end loop;
        product <= STD_LOGIC_VECTOR(acc_q_q1(8 downto 1));
    end process;
end Behavioral;
